//
//  ContentView.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainViewControllerWrapper()
    }
}

struct MainViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
        return MainViewController()
    }

    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}