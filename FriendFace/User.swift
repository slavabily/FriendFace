//
//  User.swift
//  FriendFace
//
//  Created by slava bily on 21/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    
    struct Friend: Codable, Identifiable {
        var id: String
        var name: String
    }
    
    var id: String
    var name: String
    var company: String
    var friends: [Friend]
    
}

