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
    var messages: [Message]

    // 値を返す計算プロパティ
    var recentMessageText: String {
        guard let recentMessage = self.messages.last else {
            return ""
        }

        return recentMessage.text
    }

    var recentMessageDateString: String {
        guard let recentMessage = self.messages.last else {
            return ""
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // JSON の文字列の形に合わせる
        guard let date = formatter.date(from: recentMessage.date) else {
            return ""
        }
        formatter.dateFormat = "MM/dd" // 出力したい形に改めてフォーマットする

        return formatter.string(from: date)
    }
}


