//
//  User.swift
//  table
//
//  Created by Xiao E on 2024/11/19.
//

import Foundation

enum SettingCellType {
    case single
    case top
    case middle
    case bottom
}

class User {
    let id: Int
    let name: String
    let cellType: SettingCellType
    
    init(id: Int, name: String, cellType: SettingCellType) {
        self.id = id
        self.name = name
        self.cellType = cellType
    }
}

