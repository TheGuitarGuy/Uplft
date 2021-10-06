//
//  SignIn.swift
//  Uplft
//
//  Created by John Larson on 10/5/21.
//

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    //Sign in with email and password
    func signIn() {
        if (!email.isEmpty) {
            print(email)
        }
        
    }
    //Register with email and password
    func register() {
        if (!email.isEmpty && !password.isEmpty) {
            print("Register new account")
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // ...
            }
        }
    }
    
    //TODO: Other signin options
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField(
                "Email",
                text: $email)
                .padding(.leading)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                .border(Color(UIColor.separator))
            SecureField(
                "Password",
                text: $password
            )
            .padding(.leading)
            .border(Color(UIColor.separator))
            HStack{
                if #available(iOS 15.0, *) {
                    Button(action: signIn) {
                        Text("Sign In")
                    }
                    .buttonStyle(.bordered)
                } else {
                    // Fallback on earlier versions
                    Button(action: signIn) {
                        Text("Sign In")
                    }
                }
                if #available(iOS 15.0, *) {
                    Button(action: register) {
                        Text("Register")
                    }
                    .buttonStyle(.bordered)
                } else {
                    // Fallback on earlier versions
                    Button(action: register) {
                        Text("Register")
                    }
                }
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
