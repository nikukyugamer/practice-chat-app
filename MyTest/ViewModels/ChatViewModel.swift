//
//  ChatViewModel.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import Foundation

class ChatViewModel: ObservableObject {

    // チャットルームがたくさん入っている
    @Published var chatData: [Chat] = []
    @Published var messages: [Message] = []

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

    func addMessage(chatId: String, text: String) {
        // TODO: 難しい
        // 最初に合致したものが返る
        // TODO: where: とは？
        guard let index = chatData.firstIndex(where: { chat in
            chat.id == chatId
        }) else { return }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // JSON の文字列の形に合わせる
        let formattedDateString = formatter.string(from: Date())

        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: formattedDateString,
            readed: false
        )

        // これだけでは更新されない。なぜならエントリポイントの ChatView() 時のみ表示更新だから
//        messages.append(newMessage)
        chatData[index].messages.append(newMessage)
    }
}
