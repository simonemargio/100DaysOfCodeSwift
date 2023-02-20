//
//  ContentView.swift
//  H4X0R
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import SwiftUI


struct ContentView: View {
    
    // A property wrapper type that subscribes to an observable object and invalidates a view whenever the observable object changes.
    //  With NewtworkManager we have ObservableObject, when the  "@Published var posts"
    // change this networkManager is trigger/notify
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        // Create a navigation stack
        // With this we can go back easily
        NavigationView {
            // List of elements
            // For every single "networkManager.post" in a "posts" array
            // use each of those "post" to create a new Text
            List(networkManager.posts) { post in
                // Create a button on right site of every post
                // destination: is the view that we open when the user
                // click on one post. We pass the post's url to DatailView
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
               
            }
            .navigationTitle("H4X0R NEWS")
            .listStyle(GroupedListStyle())
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        // onAppear "is" like viewDidLoad that we have seen in UIKit
        // So when body view appears on the screen onAppear call the
        // func fetchData that which takes the data via the API,
        // then the variable posts (in NetworkManager) is updated
        // and being Published it sends the notification that is
        // captured by @ObservedObject var networkManager
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Struct of single post
// Identifiable protocol to provide a stable notion of identity
// to a class or value type
// We don't use this because we have created a Post struct into
// PostData using H4X0r api
/*
struct Post: Identifiable {
    let id: String
    let title: String
    
}


let posts = [
    Post(id: "1", title: "Apple ice scream pro max is out!"),
    Post(id: "2", title: "Title two"),
    Post(id: "3", title: "Title three"),
]*/
