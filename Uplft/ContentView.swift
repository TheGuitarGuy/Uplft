//
//  ContentView.swift
//  Uplft
//
//  Created by Kennion Gubler on 10/4/21.
//

import SwiftUI

let defaults = UserDefaults.standard

struct ContentView: View {
    @State var userId: String = defaults.object(forKey: "userId") as? String ?? ""
    var body: some View {
        if !userId.isEmpty {
            CreateMessage()
        }
        else {
            SignIn(userId: $userId)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
