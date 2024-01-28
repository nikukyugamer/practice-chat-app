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
    }
}

#Preview {
    ChatView()
}