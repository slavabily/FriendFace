//
//  FriendDetailsView.swift
//  FriendFace
//
//  Created by slava bily on 23/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct FriendDetailsView: View {
    
    let friend: FriendCD
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(friend.wrappedName)")
                .bold()
            
            Text("ID: \(friend.wrappedID)")
        }
    }
}

struct FriendDetailsView_Previews: PreviewProvider {
     static let friend = FriendCD()
    
    static var previews: some View {
        FriendDetailsView(friend: friend)
    }
}
