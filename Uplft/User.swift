//
//  User.swift
//  Uplft
//
//  Created by John Larson on 10/8/21.
//

import Foundation

class User {
    var uid: String
    var email: String?

    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
}
