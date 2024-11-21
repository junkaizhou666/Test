//  UserViewController.swift
//  table
//
//  Created by Xiao E on 2024/11/19.
//

import Foundation
import UIKit
import SnapKit

protocol UserView: AnyObject {
    func reloadUserData()
}

class UserViewController: UIViewController, UserView {
    var presenter: Presenter!
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        presenter = Presenter(view: self, userService: UserService())
        presenter.loadUserData()
    }

    private func setupUI() {
        self.view.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingCell.self, forCellReuseIdentifier: "SettingCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }

    func reloadUserData() {
        tableView.reloadData()
    }
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        let user = presenter.user(at: indexPath)
        cell.nameLabel.text = user.name
        cell.setupCellCorners(cellType: user.cellType)
        return cell
    }
        
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
