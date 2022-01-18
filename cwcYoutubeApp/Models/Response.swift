//
//  Response.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/14.
//

import Foundation

/**
 Response is model to decode JSON data of videos from API into a list of videos data usable to Swift data type.
 
 ```
 // Properties
 var items: [Video]?
 ```
 */
struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
