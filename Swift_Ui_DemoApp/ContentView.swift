//
//  ContentView.swift
//  Swift_Ui_DemoApp
//
//  Created by Sonika Patel on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") var username: String = "Anonymous"

    var body: some View {
        VStack {
            Text("Welcome, \(username)!")

            Button("Log in") {
                username = "@twostraws"
            }
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
