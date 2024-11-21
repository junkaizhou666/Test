//
//  Presenter.swift
//  table
//
//  Created by Xiao E on 2024/11/19.
//

import Foundation

class Presenter {
    weak var view: UserView?
    var userService: UserService
    private(set) var sections: [[User]] = []

    init(view: UserView, userService: UserService) {
        self.view = view
        self.userService = userService
    }

    func loadUserData() {
        userService.fetchUserData { [weak self] sections in
            self?.sections = sections
            self?.view?.reloadData()
        }
    }

    func numberOfSections() -> Int {
        return sections.count
    }

    func numberOfRows(in section: Int) -> Int {
        return sections[section].count
    }

    func user(at indexPath: IndexPath) -> User {
        return sections[indexPath.section][indexPath.row]
    }
}
