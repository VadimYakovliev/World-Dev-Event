//
//  ActivitiesTableViewModel.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

typealias ActivityTableCellConfig = TableCellConfigurator<ActivityTableCell, Activity>

class ActivitiesTableViewModel: TableViewModel {
    
    let cellConfigs: [CellConfigurator]
    
    init(activities: [Activity]) {
        self.cellConfigs = activities.map { ActivityTableCellConfig(item: $0) }
    }
}
