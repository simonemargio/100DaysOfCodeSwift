//
//  PostData.swift
//  H4X0R
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import Foundation


// We see this in day 42 with Clima app
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    // When we use Identifiable we need to provide an var/let id: Int
    // But, in this case, we have objectID that identify every single post
    // So we need to create something as "id = objectID"
    // Solve this using computed property. The id var return directly objectID
    var id: String {
        return objectID
    }
    let objectID: String // This is actually a String and identify every H4X0R's post
    let title: String
    let url: String? // Is's an optional because not all H4X0R's posts have an url
    let points: Int
}

/*
    Example
     "hits": [
     {
         "created_at": "2022-09-18T04:37:58.000Z",
         "title": "Show HN: I may have created a new type of puzzle",
         "url": "http://www.dogbunnypuzzle.com/",                       <-- This can be null
         "author": "drcode",
         "points": 855,
         "story_text": null,
         "comment_text": null,
         "num_comments": 217,
         "story_id": null,
         "story_title": null,
         "story_url": null,
         "parent_id": null,
         "created_at_i": 1663475878,
         "_tags": [
         "story",
         "author_drcode",
         "story_32884467",
         "show_hn",
         "front_page"
     ],
     "objectID": "32884467",
     ...
 
 */
