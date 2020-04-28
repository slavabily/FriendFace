//
//  UserDetailsView.swift
//  FriendFace
//
//  Created by slava bily on 23/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    
    var user: UserCD
 
    var body: some View {
        VStack {
            List {
                ForEach(user.friendsArray, id: \.self) {friend in
                    NavigationLink(destination: FriendDetailsView(friend: friend)) {
                        Text(friend.wrappedName)
                    }
                }
            }
            .navigationBarTitle("\(user.wrappedName)'s friends", displayMode: .inline)
        }
        
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static let user = UserCD()

    static var previews: some View {
        UserDetailsView(user: user)
    }
}
