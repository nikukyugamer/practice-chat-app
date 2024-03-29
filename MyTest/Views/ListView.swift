//
//  ListView.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import SwiftUI

struct ListView: View {

    // ListView の中から ChatViewModel のプロパティにアクセスできる
    @ObservedObject var vm: ChatViewModel = ChatViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                header

                // List
                list
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ListView()
}

extension ListView {
    private var header: some View {
        HStack {
            Text("トーク")
                .font(.title2.bold())

            Spacer()

            HStack(spacing: 16) {
                Image(systemName: "text.badge.checkmark")
                Image(systemName: "square")
                Image(systemName: "ellipsis.bubble")
            }
            .font(.title2)
        }
    }

    private var list: some View {
        ScrollView {
            VStack {
                // Identifiable プロトコルに準拠させる
                ForEach(vm.chatData) { chat in
                    // ナビゲーション遷移パターン
                    NavigationLink {
                        // TODO: chat: chat とは？
                        // .environmentObject とは？
                        ChatView(chat: chat)
                            .environmentObject(vm)
                            .toolbar(.hidden)
                    } label: {
                        listRow(chat: chat)
                    }
                }
            }
        }
    }

    // 引数を取れるようにする
    private func listRow(chat: Chat) -> some View {
//    private var listRow: some View {
        HStack {
            let images = vm.getImages(messages: chat.messages)
            HStack(spacing: -28) {
                // TODO: id: \.self とは？ (keypath)
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .frame(width:48, height: 48)
                        .clipShape(Circle())
                        .background(Circle()
                            .foregroundColor(Color(uiColor: .systemBackground))
                            .frame(width: 54, height: 54)
                        )
                }
            }

            VStack(alignment: .leading) {
                Text(vm.getTitle(messages: chat.messages))
                    .lineLimit(1)
                    .foregroundColor(.primary)
                Text(chat.recentMessageText)
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(Color(uiColor: .secondaryLabel)
                    )
            }
            Spacer()
            Text(chat.recentMessageDateString)
                .font(.caption)
                .foregroundColor(Color(uiColor: .secondaryLabel)
                )
        }
    }
}
