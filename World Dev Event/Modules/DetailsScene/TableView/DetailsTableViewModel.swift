//
//  DetailsTableViewModel.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

typealias ImageTableCellConfig = TableCellConfigurator<FullImageTableCell, Activity.DetailsActivity>
typealias DetailsTableCellConfig = TableCellConfigurator<DetailsTableCell, Activity>

class DetailsTableViewModel: TableViewModel {
    
    let cellConfigs: [CellConfigurator]
    
    init(activity: Activity) {
        let imageTableCellConfig = ImageTableCellConfig(item: activity.details)
        let detailsTableCellConfig = DetailsTableCellConfig(item: activity)
        
        self.cellConfigs = [imageTableCellConfig, detailsTableCellConfig]
    }
}
