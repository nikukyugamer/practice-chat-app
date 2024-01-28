//
//  DataModelTest.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import SwiftUI

struct DataModelTest: View {
    let user1 = User(id: "1", name: "太郎", image: "user01")
    let user2 = User(id: "2", name: "次郎", image: "user02")

    let message = Message(
        text: "おはようございます",
        user: User(id: "1", name: "太郎", image: "user01"),
//        user: user1, // TODO: なぜこれではダメ？
        date: Date(),
        readed: false
    )

    var body: some View {
        VStack {
            Text(user1.name)
            Image(user1.image)

            Text(message.text)
            Text(message.user.name)
        }
    }
}

#Preview {
    DataModelTest()
}
