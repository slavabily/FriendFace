//
//  UserDetailsView.swift
//  FriendFace
//
//  Created by slava bily on 23/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: UserCD.entity(), sortDescriptors: []) var userCDs: FetchedResults<UserCD>
    @FetchRequest(entity: FriendCD.entity(), sortDescriptors: []) var friendCDs: FetchedResults<FriendCD>
    
    @State private var userFriends = [User.Friend]()
 
    let user: UserCD
 
    var body: some View {
        VStack {
            List {
                ForEach(friendCDs, id: \.self) {friend in
                    //                NavigationLink(destination: FriendDetailsView(friend: friend)) {
                    Text(friend.wrappedName)
                    //                }
                }
            }
            .onAppear {
                self.fetchFriends()
            }
            .navigationBarTitle("\(user.wrappedName)'s friends", displayMode: .inline)
        }
        
    }
    
    func fetchFriends() {
        for friend in friendCDs {
            print(friend.user?.wrappedName)
        }
      }
}

//struct UserDetailsView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        UserDetailsView()
//    }
//}
