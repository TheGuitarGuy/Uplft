//
//  MainView.swift
//  Uplft
//
//  Created by Kennion Gubler on 10/9/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            SignIn()
                .tabItem {
                    Image(systemName: "house")
                    Text("Sign In")
                }
            CreateMessage()
                .tabItem {
                    Image(systemName: "squareshape.split.2x2")
                    Text("Create a Message")
                }
            MessageView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Your Messages")
                }
                
        }
}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
