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
                        ChatView(chat: chat)
                            .toolbar(.hidden)
                    } label: {
                        listRow
                    }
                }
            }
        }
    }

    private var listRow: some View {
        HStack {
            Image("user01")
                .resizable()
                .frame(width:48, height: 48)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("タイトル")
                    .foregroundColor(.primary)
                Text("最新のメッセージ")
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel)
                    )
            }
            Spacer()
            Text("12/31")
                .font(.caption)
                .foregroundColor(Color(uiColor: .secondaryLabel)
                )
        }
    }
}
