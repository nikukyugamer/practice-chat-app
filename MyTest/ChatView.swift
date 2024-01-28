//
//  SwiftUIView.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import SwiftUI

struct ChatView: View {
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
                    HStack {
                        Circle()
                            .frame(width: 60, height: 60)
                        Capsule()
                            .frame(height: 60)
                    }
                    .padding(.bottom)
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
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Capsule()
                .frame(height: 40)
            Circle()
                .frame(width: 40, height: 40)
        }
        .padding()
        .background(.white)
    }

    private var navigationArea: some View {
        HStack {
            Circle()
                .frame(width: 40, height: 40)
            Text("タイトル")
            Spacer() // 画面を横いっぱいに広げる
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
            Circle()
                .frame(width: 40, height: 40)
        }
        .foregroundColor(.white)
        .padding()
        .background(.black.opacity(0.5))
    }
}
