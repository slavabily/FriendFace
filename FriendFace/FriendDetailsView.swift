//
//  FriendDetailsView.swift
//  FriendFace
//
//  Created by slava bily on 23/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct FriendDetailsView: View {
    
    let friend: User.Friend
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(friend.name)")
                .fontWeight(.bold)
            Text("ID: \(friend.id)")
        }
        
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
    
    static let friend = User.Friend(id: "...", name: "John")
    
    static var previews: some View {
        FriendDetailsView(friend: friend)
    }
}
