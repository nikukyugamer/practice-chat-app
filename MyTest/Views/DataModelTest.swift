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

    var body: some View {
        VStack {
            Text(user2.name)
            Image(user2.image)
        }
    }
}

#Preview {
    DataModelTest()
}
