//
//  SignIn.swift
//  Uplft
//
//  Created by John Larson on 10/5/21.
//
//  A view for signing in or registering.

import SwiftUI
import FirebaseAuth

extension Color {
    static let lightGray = Color(red: 142 / 255, green: 142 / 255, blue: 142 / 255)
}
extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 1).padding(.top, 35))
            .foregroundColor(.lightGray)
            .padding(10)
    }
}

struct SignIn: View {
    @Binding var userId: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State var signInFailed: Bool = false
    @State var signInSucceeded: Bool = false
    // Awesome button animation
    struct ButtonAnimation: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
                .brightness(configuration.isPressed ? 0.1 : 0)
        }
        
    }
    //Sign in with email and password
    func signIn() {
        if (!email.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let user = authResult?.user {
                    print("Succesful login")
                    userId = user.uid
                    signInFailed = false
                    signInSucceeded = true
                    defaults.set(userId, forKey: "userId")
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
                    defaults.set(userId, forKey: "userId")
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
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 50, idealWidth: 50, maxWidth: 150, minHeight: 50, idealHeight: 50, maxHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40.0)
                .padding(.top, 20.0)
            //Login
            Text("Login").font(.system(size: 30, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.66, blue: 0.66, alpha: 1))).tracking(-0.64)
            TextField(
                "Email",
                text: $email)
                .underlineTextField()
                .padding(.leading)
                
            SecureField("Enter a password", text: $password)
                .underlineTextField()
                .padding(.leading)
                
            
            HStack{
                if #available(iOS 15.0, *) {
                    Button(action: signIn) {
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 36)
                                .fill(Color(#colorLiteral(red: 0.9254902005195618, green: 0, blue: 0.5490196347236633, alpha: 1)))
                                .frame(width: 150, height: 50)
                                .shadow(color: Color(#colorLiteral(red: 0.2541666626930237, green: 0.23298610746860504, blue: 0.23298610746860504, alpha: 0.25)), radius:1, x:3, y:3)
                            Text("Login").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.64)
                        }

                    }
                    .buttonStyle(ButtonAnimation())
                    
                } else {
                    
                    Button(action: signIn) {
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 36)
                                .fill(Color(#colorLiteral(red: 0.9254902005195618, green: 0, blue: 0.5490196347236633, alpha: 1)))
                                .frame(width: 150, height: 50)
                                .shadow(color: Color(#colorLiteral(red: 0.2541666626930237, green: 0.23298610746860504, blue: 0.23298610746860504, alpha: 0.25)), radius:1, x:3, y:3)
                            Text("Login").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.64)
                        }
                    }
                    .buttonStyle(ButtonAnimation())
                }
                if #available(iOS 15.0, *) {
                    Button(action: register) {
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 36)
                                .fill(Color(#colorLiteral(red: 0, green: 0.6823529601097107, blue: 0.9372549057006836, alpha: 1)))
                                .frame(width: 150, height: 50)
                                .shadow(color: Color(#colorLiteral(red: 0.2541666626930237, green: 0.23298610746860504, blue: 0.23298610746860504, alpha: 0.25)), radius:1, x:3, y:3)
                            Text("Register").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.64)
                        }

                    }
                    .buttonStyle(ButtonAnimation())
                } else {
                    // Fallback on earlier versions
                    Button(action: register) {
                        ZStack
                        {
                            RoundedRectangle(cornerRadius: 36)
                                .fill(Color(#colorLiteral(red: 0, green: 0.6823529601097107, blue: 0.9372549057006836, alpha: 1)))
                                .frame(width: 150, height: 50)
                                .shadow(color: Color(#colorLiteral(red: 0.2541666626930237, green: 0.23298610746860504, blue: 0.23298610746860504, alpha: 0.25)), radius:1, x:3, y:3)
                            Text("Register").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.64)
                        }
                    }
                    .buttonStyle(ButtonAnimation())
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
