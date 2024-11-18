//
//  PostData.swift
//  H4X0R
//
//  Created by Jeff Patterson on 11/17/24.
//

import Foundation

/// The Hacker News API URL we are using returns the data with fields that we don't really need.
/// This struct will map the fields we do want into a format that the application can use.
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    /// Identifiable requires a property called id. The Hacker News JSON object already has an Id but
    /// the name is wrong. Since we have to use the HN field to get the proper items we use a computed
    /// property to conver the HN field into the field required from the protocol Identifiable.
    var id: String { return self.objectID }
    
    /// This property has to have a name for the protocol to work AND it has to be here for the JSON
    /// decoder to decode properly and render the HN story headlines.
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
