//
//  MyTestApp.swift
//  MyTest
//
//  Created by Osamu Takiya on 2024/01/28.
//

import SwiftUI

@main // アプリのエントリポイントを示す
struct ChatViewWithSwiftUIApp: App {
    var body: some Scene {
        // アプリが起動したときに表示される画面
        WindowGroup {
            ChatView()
        }
    }
}
