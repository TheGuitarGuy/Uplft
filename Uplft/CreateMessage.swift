//
//  CreateMessage.swift
//  Uplft
//
//  Created by Kennion Gubler on 10/4/21 (body was moved to this file by John Larson on 10/5/21)
//

import SwiftUI
import Firebase

var ref: DatabaseReference!



func sendMessage() {
    //Pick a random user from firebase https://stackoverflow.com/a/60518405
    ref = Database.database().reference()
    let profilesRef = ref.child("users")
    var winnerId = ""
    profilesRef.observe(.value, with:
                            {
        //doing everything in the callback because no time to figure out a better way for now!
        snapshot in
        let allProfiles = snapshot.children.shuffled()
        let randomProfile = allProfiles.randomElement()
        let winner = randomProfile!
        winnerId = String(describing: winner)
        //Get just the part of the string we want (a pain)
        let start = winnerId.index(winnerId.startIndex, offsetBy: 6)
        let end = winnerId.index(winnerId.startIndex, offsetBy: 33)
        let range = start...end
        let subString = String(winnerId[range])
        print(winnerId)
        winnerId = String(subString)
        print(winnerId)
        
        //We have the ID to send the message to. Now post the message
    })
}


struct CreateMessage: View {
    @State var message: String = ""
    var scale_effect = 0
    
    struct ButtonAnimation: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
                .brightness(configuration.isPressed ? 0.1 : 0)
        }
        
    }
    var body: some View {
        
        
        VStack
        {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 50, idealWidth: 50, maxWidth: 150, minHeight: 50, idealHeight: 50, maxHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 40.0)
                .padding(.top, 20.0)
            //Create a Message.
            Text("Create a Message.").font(.system(size: 25, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.66, blue: 0.66, alpha: 1))).tracking(-0.64)
            
            //Enter a positive mes
            Text("Enter a positive message here.").font(.system(size: 18, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.66, blue: 0.66, alpha: 1))).tracking(-0.51).padding(.top, 75.0).padding(.bottom, 30.0)
            
            Section{
                
                TextField("You are amazing!", text: $message)
                    .overlay(VStack{Divider().offset(x: 0, y: 15)})
                    .padding(.top, 50.0).padding(.bottom, 75.0).padding(.leading, 50.0).padding(.trailing, 50.0)
            }
            Button(action: sendMessage) {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 36)
                        .fill(Color(#colorLiteral(red: 0.9254902005195618, green: 0, blue: 0.5490196347236633, alpha: 1)))
                        .frame(width: 303, height: 79)
                        .shadow(color: Color(#colorLiteral(red: 0.2541666626930237, green: 0.23298610746860504, blue: 0.23298610746860504, alpha: 0.25)), radius:1, x:3, y:3)
                    Text("Send").font(.system(size: 30, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.64)
                }
                .padding(.bottom, 50)
            }
            .padding(.horizontal, 36.0)
            .buttonStyle(ButtonAnimation())
        }
    }
    
}

struct CreateMessage_Previews: PreviewProvider {
    static var previews: some View {
        CreateMessage()
    }
}
