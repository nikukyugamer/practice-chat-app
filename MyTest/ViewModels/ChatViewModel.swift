//
//  ChatViewModel.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

class ChatViewModel {

    var chatData: [Chat] = []
    var messages: [Message] = []

    init() {
        chatData = fetchChatDate()
        messages = chatData[0].messages // 仮のデータ
    }

    private func fetchChatDate() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data

        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("\(fileName)が見つかりませんでした。")
        }

        do {
            // この時点ではまだ生のテキストデータ
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました。")
        }

        do {
            // TODO: Decodable プロトコルに準拠させる（？）
            // TODO: [Chat].self とは？
            return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換することに失敗しました。")

        }
    }

    func addMessage() {
        print("イベントを処理します！")
    }
}
