//
//  MessageView.swift
//  Uplft
//
//  Created by Kennion Gubler on 10/9/21.
//

import SwiftUI
import Firebase


struct MessageView: View {
    var body: some View {
        VStack{
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 50, idealWidth: 50, maxWidth: 150, minHeight: 50, idealHeight: 50, maxHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40.0)
                .padding(.top, 20.0)
            Text("Your Message:").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.66, blue: 0.66, alpha: 1))).tracking(-0.64)
                .padding(.bottom, 80)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(#colorLiteral(red: 0.9254902005195618, green: 0, blue: 0.5490196347236633, alpha: 0.699999988079071)))
                    .frame(width: 300, height: 90)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:4, x:0, y:4)
                Text("Hey! You’re amazing!").font(.custom("Roboto Regular", size: 16)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).frame(width: 250.0, height: 80.0)
            }

            
            
        }

    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
