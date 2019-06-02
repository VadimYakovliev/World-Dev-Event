//
//  TableViewAdapter.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol TableViewModel {
    var cellConfigs: [CellConfigurator] { get }

    func pass(cell: UITableViewCell)
}

extension TableViewModel {
    func pass(cell: UITableViewCell) {}
    
    var numberOfRows: Int {
        return self.cellConfigs.count
    }
}

class TableViewAdapter: NSObject {
    private var tableViewModel: TableViewModel?
    
    var onSelectItemAtIndexPathHandler: ((IndexPath) -> Void)?
    
    func set(tableViewModel: TableViewModel) {
        self.tableViewModel = tableViewModel
    }
    
    private func prepareCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellConfig = self.tableViewModel?.cellConfigs[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: type(of: cellConfig).reuseId)
            else { return UITableViewCell() }
        
        cell.tag = indexPath.row
        cellConfig.configure(cell: cell)
        
        return cell
    }
}

extension TableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewModel?.numberOfRows ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.prepareCell(tableView, indexPath: indexPath)
    }
}

extension TableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.tableViewModel?.pass(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.onSelectItemAtIndexPathHandler?(indexPath)
    }
}
