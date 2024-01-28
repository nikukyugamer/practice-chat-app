//
//  MessageRow.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import SwiftUI

struct MessageRow: View {
    let message: Message

    var body: some View {
        HStack(alignment: .top) {
            userThumb
            messageText
            messageState
            Spacer()
        }
        .padding(.bottom)
    }
}

//#Preview {
//    MessageRow()
//        .background(.cyan)
//}

extension MessageRow {

    private var userThumb: some View {
        Image(message.user.image)
            .resizable()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
    }

    private var messageText: some View {
        Text(message.text)
            .padding()
            .background(.white)
            .cornerRadius(30)
    }

    private var messageState: some View {
        VStack(alignment: .trailing) {
            Spacer()
            if message.readed {
                Text("既読")
            }
            Text(formattedDateString)
        }
        .foregroundColor(.secondary)
        .font(.footnote)
    }

    private var formattedDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // JSON の文字列の形に合わせる
        guard let date = formatter.date(from: message.date) else {
            return ""
        }
        formatter.dateFormat = "HH:mm" // 出力したい形に改めてフォーマットする

        return formatter.string(from: date)
    }
}
