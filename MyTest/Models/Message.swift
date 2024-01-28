//
//  Message.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

// TODO: Identifiable とは？
struct Message: Decodable, Identifiable {
    let id: String
    let text: String
    let user: User
    let date: String
    let readed: Bool
}
