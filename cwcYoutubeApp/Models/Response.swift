//
//  Response.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/14.
//

import Foundation

/**
 Response is model to decode JSON data of videos and page information from API into a list of videos data and followed page information data usable to Swift data type.
 
 ```
 // Properties
 var items: [Video]?
 var prevPageToken: String = ""
 var nextPageToken: String = ""
 var totalResults: Int?
 ```
 */
struct Response: Decodable {
    
    var items: [Video]?
    var prevPageToken = ""
    var nextPageToken = ""
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case items
        case prevPageToken
        case nextPageToken
        case pageInfo
        
        case totalResults
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
        
        do {
            self.prevPageToken = try container.decode(String.self, forKey: .prevPageToken)
        } catch {
            self.prevPageToken = ""
        }
        
        do {
            self.nextPageToken = try container.decode(String.self, forKey: .nextPageToken)
        } catch {
            self.nextPageToken = ""
        }
        
        let pageInfoContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .pageInfo)
        self.totalResults = try pageInfoContainer.decode(Int.self, forKey: .totalResults)
    }
}
