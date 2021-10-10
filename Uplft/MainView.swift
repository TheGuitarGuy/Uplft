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
            CreateMessage()
                .tabItem {
                    Image(systemName: "paperplane.fill")
                    Text("Create a Message")
                }
            MessageView()
                .tabItem {
                    Image(systemName: "envelope.open.fill")
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
