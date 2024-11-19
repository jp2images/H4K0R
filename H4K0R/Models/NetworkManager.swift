//
//  NetworkManager.swift
//  H4K0R
//
//  Created by Jeff Patterson on 11/17/24.
//

import Foundation

/// ObservableObject lets this class broadcast one or more properties to any interested objects
class NetworkManager: ObservableObject {

    /// The variable posts is the list of HN posts that we publish and let other objects subscribe to receive
    /// updates.
    @Published var posts = [Post]()

    /// Get a list in JSON of all the current items on the Hacker News main page.
    /// This will contain many fileds that we don't really care about, so we create a decoder struct
    /// that contains only the data we want to use in the app.
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
