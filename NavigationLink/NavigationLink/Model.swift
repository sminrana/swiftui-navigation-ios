//
//  Model.swift
//  NavigationLink
//
//  Created by Smin Rana on 7/23/20.
//  Copyright © 2020 Smin Rana. All rights reserved.
//

import Foundation

/// Main menu item for the list
struct Menu: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var destination: ViewType
}

enum ViewType {
    case home
    case view1
    case view2
}
