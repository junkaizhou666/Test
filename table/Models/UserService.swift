//
//  UserService.swift
//  table
//
//  Created by Xiao E on 2024/11/19.
//

import Foundation
class UserService {
    func fetchUserData(completion: @escaping ([[User]]) -> Void) {
        let sections = [
            [User(id: 1, name: "系统权限设置", cellType: .single)],
            [User(id: 2, name: "个人信息收集清单", cellType: .top),
             User(id: 3, name: "意见反馈", cellType: .middle),
             User(id: 4, name: "第三方信息共享清单", cellType: .bottom)],
            [User(id: 5, name: "清除缓存", cellType: .top),
             User(id: 6, name: "关于我们", cellType: .bottom)]
        ]
        completion(sections)
    }
}
