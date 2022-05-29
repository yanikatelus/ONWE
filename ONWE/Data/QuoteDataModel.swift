//
//  quotedata.swift
//  ONWE
//
//  Created by Yanika Telus on 5/28/22.
//

import Foundation

//https://api.quotable.io/random
//https://api.quotable.io/random?tags=inspirational

//struct BlogPost: Decodable {
//    enum Category: String, Decodable {
//        case swift, combine, debugging, xcode
//    }
//
//    var _id: String
//    var content: String
//    var author: String
//    var authorSlug: String
//    var length: Double
//}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var _id: String
    var content: String
    var author: String
    var authorSlug: String
    var length: Double
}
