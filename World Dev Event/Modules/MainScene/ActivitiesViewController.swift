//
//  ActivitiesViewController.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol ActivitiesViewContract: AnyObject {
    func update(withModel tableViewModel: ActivitiesTableViewModel)
    
    func showAlert(text: String,
                   defaultButtonTitle: String,
                   cancelButtonTitle: String?,
                   completion: ((BaseViewController.AlertAction) -> Void)?)
}

final class ActivitiesViewController: BaseViewController {
    var presenter: ActivitiesPresenterContract!
    
    private let tableView = UITableView()
    private var tableViewAdapter = TableViewAdapter()
    
    func bind(presenter: ActivitiesPresenterContract) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        self.presenter.onViewDidLoad()
        self.listenDidSelectCell()
    }
}

extension ActivitiesViewController: ActivitiesViewContract {
    func update(withModel tableViewModel: ActivitiesTableViewModel) {
        onMainQueue {
            self.tableViewAdapter.set(tableViewModel: tableViewModel)
            
            self.tableView.reloadData()
        }
    }
}

private extension ActivitiesViewController {
    func configureTableView() {
        self.tableView.registerCellClass(ActivityTableCell.self)
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.alwaysBounceHorizontal = false
        
        self.tableView.delegate = self.tableViewAdapter
        self.tableView.dataSource = self.tableViewAdapter
        
        self.view.addSubview(self.tableView)
        
        self.tableView.fillSuperview()
    }
    
    func listenDidSelectCell() {
        self.tableViewAdapter.onSelectItemAtIndexPathHandler = { [weak self] indexPath in
            self?.presenter.onDidSelectCell(index: indexPath.row)
        }
    }
}
