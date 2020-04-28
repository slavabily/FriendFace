//
//  ContentView.swift
//  FriendFace
//
//  Created by slava bily on 21/4/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: UserCD.entity(), sortDescriptors: []) var userCDs: FetchedResults<UserCD>
    
    @State private var users = [User]()
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(userCDs, id: \.self) {userCD in
                        NavigationLink(destination: UserDetailsView(user: userCD)) {
                            VStack(alignment: .leading) {
                                Text(userCD.wrappedName)
                                    .bold()
                                Text(userCD.wrappedCompany)
                                .italic()
                            }
                        }
                    }
                }
                .onAppear {
                    self.fetchUsers()
                }
                Button("Save") {
                    self.saveToCD()
                }
            }
            .navigationBarTitle("Users")
        }
    }
    
    func saveToCD() {
        for user in users {
            let userCD = UserCD(context: moc)
            userCD.name = user.name
            userCD.company = user.company
            for friend in user.friends {
                let friendCD = FriendCD(context: moc)
                friendCD.id = friend.id
                friendCD.name = friend.name
                friendCD.user = UserCD(context: moc)
                friendCD.user?.name = user.name
            }
        }
        do {
            try self.moc.save()
        } catch {
            print(error.localizedDescription)
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
