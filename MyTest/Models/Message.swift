//
//  Message.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

struct Message {
    let id: String = UUID().uuidString // 初期値を入れる
    let text: String
    let user: User
    let date: Date
    let readed: Bool
}
