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
        // 一行の場合は return は省略できる
        return self.id == "1"
    }
}
