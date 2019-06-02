//
//  CellConfigurator.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/2/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import UIKit

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView?)
}

class TableCellConfigurator<CellType: Configurable, CellPresentationModel> {
    let item: CellPresentationModel
    
    init(item: CellPresentationModel) {
        self.item = item
    }
}

extension TableCellConfigurator: CellConfigurator
where CellType.PresentationModel == CellPresentationModel, CellType: UITableViewCell {
    static var reuseId: String { return CellType.identifier }
    
    func configure(cell: UIView?) {
        (cell as? CellType)?.configure(presentationModel: self.item)
    }
}
