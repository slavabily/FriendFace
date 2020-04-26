//
//  UserDetailsView.swift
//  FriendFace
//
//  Created by slava bily on 23/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    
    let user: User
    
    var body: some View {
        List {
            ForEach(user.friends) {friend in
                NavigationLink(destination: FriendDetailsView(friend: friend)) {
                    Text(friend.name)
                }
            }
        }
        .navigationBarTitle("\(user.name)'s friends", displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    
    static var users = [User]()
 
    static var previews: some View {
        UserDetailsView(user: users[0])
    }
}
