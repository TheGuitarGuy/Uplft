//
//  ContentView.swift
//  Uplft
//
//  Created by Kennion Gubler on 10/4/21.
//

import SwiftUI

struct ContentView: View {
    @State var message: String = ""
    var body: some View {
        
        
        VStack
        {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 50, idealWidth: 50, maxWidth: 100, minHeight: 50, idealHeight: 50, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 20.0)
            //Create a Message.
            Text("Create a Message.").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.66, blue: 0.66, alpha: 1))).tracking(-0.64)
            
            //Enter a positive mes
            Text("Enter a positive message here.").font(.system(size: 20, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.66, blue: 0.66, alpha: 1))).tracking(-0.51).padding(.top, 75.0).padding(.bottom, 50.0)
           
                Section{
                    
                    TextField("You are amazing!", text: $message)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                        .padding(.top, 100.0).padding(.bottom, 75.0).padding(.leading, 70.0).padding(.trailing, 50.0)
                }
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 36)
                        .fill(Color(#colorLiteral(red: 0.9254902005195618, green: 0, blue: 0.5490196347236633, alpha: 1)))
                        .frame(width: 303, height: 79)
                        .shadow(color: Color(#colorLiteral(red: 0.2541666626930237, green: 0.23298610746860504, blue: 0.23298610746860504, alpha: 0.25)), radius:1, x:3, y:3)
                    Text("Send").font(.system(size: 30, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.64)
                }
            }
            .padding(.horizontal, 36.0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
