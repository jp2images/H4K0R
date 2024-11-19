//
//  ContentView.swift
//  H4K0R
//
//  Created by Jeff Patterson on 11/16/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        VStack {
            NavigationView {
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                        }
                    }
                }
                .navigationTitle("My H4K0R News")
            }
            .onAppear {
                self.networkManager.fetchData()
            }
        }
        .padding()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello, world!"),
//    Post(id: "2", title: "SwiftUI is awesome!"),
//    Post(id: "3", title: "I'm learning SwiftUI!"),
//]

#Preview {
    ContentView()
}
