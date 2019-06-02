//
//  ActivitiesPresenter.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

protocol ActivitiesPresenterContract: BasePresenterContract {
    func switchState(index: Int)
    func onDidSelectCell(index: Int)
}

final class ActivitiesPresenter {
    unowned var view: ActivitiesViewContract
    private let repository: ActivitiesRepositoryContract
    
    var onActivitySelectListener: ((Activity) -> Void)?
    
    private var sceneState: ActivityType = .event {
        didSet {
            self.fetchData()
        }
    }
    
    init(view: ActivitiesViewContract, repository: ActivitiesRepositoryContract) {
        self.view = view
        self.repository = repository
    }
}

extension ActivitiesPresenter: ActivitiesPresenterContract {
    func onViewDidLoad() {
        self.fetchData()
    }
    
    func switchState(index: Int) {
        self.sceneState = (index == .zero) ? .event : .shop
    }
    
    func onDidSelectCell(index: Int) {
        let activity = self.repository.getActivity(byIndex: index, type: self.sceneState)
        self.onActivitySelectListener?(activity)
    }
}

private extension ActivitiesPresenter {
    func alert(text: String) {
        self.view.showAlert(text: text,
                            defaultButtonTitle: Titles.Buttons.retry,
                            cancelButtonTitle: Titles.Buttons.cancel) { [weak self] action in
                                switch action {
                                case .defaultPressed:
                                    self?.fetchData()
                                case .cancelPressed:
                                    break
                                }
        }
    }
    
    func fetchData() {
        onGlobalUtilityQueue {
            self.repository.getActivities(byType: self.sceneState) { [weak self] result in
                switch result {
                case .success(let activities):
                    let tableViewModel = ActivitiesTableViewModel(activities: activities)
                    self?.view.update(withModel: tableViewModel)
                case .failure(let error):
                    self?.alert(text: error.description)
                }
            }
        }
    }
}
