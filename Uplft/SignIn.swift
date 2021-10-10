//
//  SignIn.swift
//  Uplft
//
//  Created by John Larson on 10/5/21.
//
//  A view for signing in or registering.

import SwiftUI
import Firebase


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
    @State private var email: String = ""
    @State private var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
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
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    func signUp() {
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
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
                .disableAutocorrection(true)
                .autocapitalization(UITextAutocapitalizationType.none)
            
            SecureField("Enter a password", text: $password)
                .underlineTextField()
                .padding(.leading)
            
            if (error) {
                Text("Error signing in!")
            }
            
            HStack{
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
                
                Button(action: signUp) {
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
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
