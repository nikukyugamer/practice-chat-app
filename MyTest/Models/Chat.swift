//
//  Chat.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

// イメージとしては「チャットルーム」
struct Chat: Decodable, Identifiable {
    let id: String
    let messages: [Message]

    // 値を返す計算プロパティ
    var recentMessageText: String {
        guard let recentMessage = self.messages.last else {
            return ""
        }

        return recentMessage.text
    }
}


