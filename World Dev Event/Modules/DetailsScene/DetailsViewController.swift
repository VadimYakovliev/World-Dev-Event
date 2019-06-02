//
//  DetailsViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol DetailsViewContract: AnyObject {
    func update(withModel tableViewModel: DetailsTableViewModel)
}

final class DetailsViewController: BaseViewController {
    var presenter: DetailsPresenterContract!
    
    private let tableView = UITableView()
    private var tableViewAdapter = TableViewAdapter()
    
    func bind(presenter: DetailsPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.presenter.onViewDidLoad()
    }
}

extension DetailsViewController: DetailsViewContract {
    func update(withModel tableViewModel: DetailsTableViewModel) {
        onMainQueue {
            self.tableViewAdapter.set(tableViewModel: tableViewModel)
            self.tableView.reloadData()
        }
    }
}

private extension DetailsViewController {
    func configureTableView() {
        self.tableView.backgroundColor = .clear
        
        self.tableView.registerCellClass(FullImageTableCell.self)
        self.tableView.registerCellClass(DetailsTableCell.self)
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.alwaysBounceHorizontal = false

        self.tableView.rowHeight = UITableView.automaticDimension

        self.tableView.dataSource = self.tableViewAdapter
        
        self.view.add(self.tableView)
        self.tableView.equalSizeToSuperview()
    }
}
