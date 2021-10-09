//
//  SessionStore.swift
//  Uplft
//
//  Created by John Larson on 10/8/21.
//
//  Thanks to https://benmcmahen.com/authentication-with-swiftui-and-firebase/
//  and https://stackoverflow.com/questions/58449898/observing-firebase-authenfication-with-observableobject
//  for guides on how to do this

import SwiftUI
import Firebase
import Combine

class SessionStore : ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    @Published var session: User? {
        didSet {
            objectWillChange.send()
        }
    }
    var handle: AuthStateDidChangeListenerHandle?
    
    deinit {
        stopListen()
    }
    
    func listen () {
        handle = Auth.auth().addStateDidChangeListener{ [unowned self] (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.session = User(
                    uid: user.uid,
                    email: user.email
                )
                //Write user to database also
                var ref: DatabaseReference!

                ref = Database.database().reference()
                
                ref.child("users").child(user.uid).setValue(["email": user.email])
            } else {
                self.session = nil
            }
        }
    }
    func stopListen() {
            if let handle = handle {
                Auth.auth().removeStateDidChangeListener(handle)
            }
        }
    
    func signUp(
           email: String,
           password: String,
           handler: @escaping AuthDataResultCallback
           ) {
               Auth.auth().createUser(withEmail: email, password: password, completion: handler)
       }
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
        ) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }

    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        } catch {
            return false
        }
    }
}
