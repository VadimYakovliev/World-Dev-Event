//
//  Constants.swift
//  World Dev Event
//
//  Created by Vadym Yakovliev on 6/1/19.
//  Copyright © 2019 Vadim Yakovliev. All rights reserved.
//

import Foundation

enum API {
    private static let domain = "http://smartbox.software"
    
    static let activities = domain + "/tt/TT.json"
}

enum Titles {
    enum Buttons {
        static let ok = "Ok"
        static let retry = "Retry"
        static let cancel = "Cancel"
        
        static let showMap = "Show on map"
    }
    
    enum Screens {
        static let activities = "World Dev Event"
    }
    
    enum Tabs {
        static let events = "Events"
        static let shops = "Shops"
    }
}

enum RobotoFont: String {
    case medium = "Roboto-Medium"
    case regular = "Roboto-Regular"
}
