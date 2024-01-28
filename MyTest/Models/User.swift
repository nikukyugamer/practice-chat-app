//
//  User.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let image: String

    // TODO: 計算プロパティなので var で定義する
    var isCurrentUser: Bool {
        return self.id == User.currentUser.id
    }

    static var currentUser: User {
        User(id: "1", name: "一郎", image: "user01")
    }
}
