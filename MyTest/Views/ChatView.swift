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
    // TODO: @FocusState とは
    @FocusState private var textFieldFocused: Bool

    // TODO: これは何？
    // 遷移した画面を閉じるためのトリガ（dismiss が環境変数とは？）
    @Environment(\.dismiss) private var dismiss

    // var でなくてはいけない
    // ObservableObject に準拠していなくてはならない
    // TODO: まとめ
    // 1. 画面の構造体の中で、データを保持しているクラスのインスタンスを格納するプロパティに、
    // @ObservedObject というプロパティラッパーを付与する
    // 2. データを保持しているクラスを @ObservableObject プロトコルに準拠させる
    // 3. クラスの中で、変更を反映する値を保持しているプロパティに、 @Published というプロパティラッパーを付与する
    @ObservedObject var vm: ChatViewModel = ChatViewModel()

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
        ScrollViewReader { proxy in
            // Message エリア
            ScrollView {
                VStack(spacing: 0) {
                    // TODO: \.id とは？
    //                ForEach(vm.messages, id: \.id) { _ in
                    ForEach(vm.messages) { message in
                        // TODO: message: message とは？（キーワード引数？）
                        MessageRow(message: message) // カッコを付ける必要がある
                    }
                }
                .padding(.horizontal)
                .padding(.top, 72)
            }
            .background(.cyan)
            .onTapGesture {
                textFieldFocused = false
            }
            .onAppear {
                scrollToLast(proxy: proxy)
            }
        }

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
                .onSubmit {
                    sendMessage()
                }
                .focused($textFieldFocused) // TODO: ドルマーク？
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding()
        .background(.white)
    }

    private var navigationArea: some View {
        HStack {
            Button {
                // Action
                dismiss()
            } label: {
                // 予め用意されているアイコン（右上の + 記号から Symbol で選べる）
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
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

    private func sendMessage() {
        if !textFieldText.isEmpty {
            // TODO: textFieldText？ $がつかない？
            vm.addMessage(text: textFieldText)
            // @State なので、変更したらビューが再描画される
            textFieldText = ""
        }
    }

    private func scrollToLast(proxy: ScrollViewProxy) {
        if let lastMessage = vm.messages.last {
            proxy.scrollTo(lastMessage.id, anchor: .bottom)
        }
    }
}
