//
//  ContentView.swift
//  Uplft
//
//  Created by Kennion Gubler on 10/4/21.
//
//  Shoutout to https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
//  which helped me figure out issues I was having with EnvironmentObject -John

import SwiftUI

struct ContentView: View {
    @StateObject var session = SessionStore()
    
    func getUser () {
        session.listen()
    }
    var body: some View {
        Group {
            if session.session != nil {
                CreateMessage()
            }
            else {
                SignIn()
            }
        }
        .onAppear(perform: getUser)
        .environmentObject(session)
    }
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionStore())
    }
}
