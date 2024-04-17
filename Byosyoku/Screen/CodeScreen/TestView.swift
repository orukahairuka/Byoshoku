//
//  TestView.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/17.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Button {
            print("apiとってくる")
            APIController(date: "何渡せばいい？")
        } label: {
            Text("推して")
        }
    }
}

#Preview {
    TestView()
}
