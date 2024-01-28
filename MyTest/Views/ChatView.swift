//
//  SwiftUIView.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import SwiftUI

struct ChatView: View {

    // @State　は、プロパティの値が変更されるとともに View の表示が変更される
    @State private var textFieldText: String = ""

    let vm: ChatViewModel = ChatViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // Message Area（プロパティの呼び出しなのでカッコは不要）
            messageArea

            .overlay( // かぶさる Nav Area
                navigationArea, alignment: .top // メッセージの上側に配置
            )

            // Input エリア
            inputArea
        }
    }
}

#Preview {
    ChatView()
}

extension ChatView {
    // some は型の抽象化
    private var messageArea: some View {

        // Message エリア
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<15) { _ in
                    MessageRow() // カッコを付ける必要がある
                }
            }
            .padding(.horizontal)
            .padding(.top, 72)
        }
        .background(.cyan)
    }

    private var inputArea: some View {
        // 要素が横に並ぶので HStack
        HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)

            // データバインディングのため、$ を用いて参照を渡す必要がある
            TextField("プレイスホルダ", text: $textFieldText)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    , alignment: .trailing
                )
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding()
        .background(.white)
    }

    private var navigationArea: some View {
        HStack {
            // 予め用意されているアイコン（右上の + 記号から Symbol で選べる）
            Image(systemName: "chevron.backward")
                .font(.title2)
            Text("タイトル")
                .font(.title2.bold())
            Spacer() // 画面を横いっぱいに広げる
            HStack(spacing: 16) {
                Image(systemName: "text.magnifyingglass")
                Image(systemName: "phone")
                Image(systemName: "line.3.horizontal")
            }
            .font(.title2)
        }
        .padding()
        .background(.cyan.opacity(0.9))
    }
}
