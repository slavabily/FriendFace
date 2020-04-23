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
    
    static func fetchUsers() {
           let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           
           URLSession.shared.dataTask(with: request) { data, response, error in
               guard let data = data else {
                   print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                   return
               }
               if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                UserDetailsView_Previews.users = decoded
               } else {
                   print("Invalid response from server")
               }
           }.resume()
    }
 
    static var previews: some View {
        UserDetailsView(user: users[0])
    }
}
