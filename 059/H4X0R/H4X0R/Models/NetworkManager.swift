//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation

// ObservableObject: means that it can actually starts to broadcast one or
// many of its proprieties to any insterested parties
class NetworkManager: ObservableObject {
    
    // Inizialize it as a new array od Post objects
    // Published: is a property with the @Published attribute creates a publisher of this type.
    // You access the publisher with the $ operator
    @Published var posts = [Post]()
    
    // Fetch data with H4X0R api
    func fetchData() {
        // Same think we have done in Clima app (day 42)
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
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

