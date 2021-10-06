//
//  SignIn.swift
//  Uplft
//
//  Created by John Larson on 10/5/21.
//
//  A view for signing in or registering.

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    @Binding var userId: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State var signInFailed: Bool = false
    @State var signInSucceeded: Bool = false
    
    //Sign in with email and password
    func signIn() {
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let user = authResult?.user {
                    print("Succesful login")
                    userId = user.uid
                    signInFailed = false
                    signInSucceeded = true
                }
                else if (error != nil) {
                    print("Error logging in!")
                    signInFailed = true
                }
            }
        }
        
    }
    //Register with email and password
    func register() {
        if (!email.isEmpty && !password.isEmpty) {
            print("Register new account")
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let user = authResult?.user {
                    print("ID is \(user.uid)")
                    userId = user.uid
                    signInFailed = false
                    signInSucceeded = true
                }
                else if (error != nil) {
                    print("Error creating account!")
                }
            }
        }
    }
    
    //TODO: Other signin options
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
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
            if signInFailed {
                Text("Incorrect email or password!")
                    .font(.callout)
                    .foregroundColor(.red)
            }
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

//The normal preview does not play well with bindings. Hence this.
//https://developer.apple.com/forums/thread/118589
struct BindingPreviewHelper : View {
     @State private var dummy = "coolguy"

     var body: some View {
          SignIn(userId: $dummy)
     }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        BindingPreviewHelper()
    }
}
