//
//  Chat.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

struct Chat: Decodable {
    let id: String
    let messages: [Message]
}
