//
//  ContentView.swift
//  FriendFace
//
//  Created by slava bily on 21/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(users) {user in
                        NavigationLink(destination: UserDetailsView(user: user)) {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .fontWeight(.bold)
                                Text(user.company)
                            }
                        }
                     }
                }
                .onAppear {
                   self.fetchUsers()
                }
            }
        .navigationBarTitle("Users")
        }
    }
    
    func fetchUsers() {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                    return
                }
                if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                    self.users = decoded
                } else {
                    print("Invalid response from server")
                }
            }.resume()
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
