//
//  CacheManager.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/18.
//
/*
 CacheManager store the cache data for videos, so prevent repeatitive load of data through HTTP call.
 In this application, the CacheManager stores cache data for thumbnail of videos.
 */

import Foundation

/**
 * CacheManager store the cache data for videos, so prevent repeatitive load of data through HTTP call.
 *
 * In this application, the CacheManager stores cache data for thumbnail of videos.
 *
 * @param
 * @return
 */
class CacheManager {
    
    static var cache: [String: Data] = [:]
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        // Store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
    }
}
