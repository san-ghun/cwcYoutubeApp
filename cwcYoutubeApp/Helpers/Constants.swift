//
//  Constants.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/13.
//

import Foundation

/**
 Storing Constants values that needed to run the application.
 
 To run the app properly, input the API_KEY for YouTube Data API v3 from Google Cloud Platform.
 
 **Note**: Need `API_Key` and `PLAYLIST_ID` to complete `API_URL` which is needed to get YouTube Videos data in the playlist from API call.
 
 */
class Constants {
    static let shared: Constants = Constants()
    
    var MAX_RESULTS = 10
    var API_KEY = ""
    var PLAYLIST_ID = ""
    var PAGE_TOKEN = ""
    
    var API_URL: String {
        get {
            "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=\(MAX_RESULTS)&pageToken=\(PAGE_TOKEN)&playlistId=\(Constants.shared.PLAYLIST_ID)&key=\(Constants.shared.API_KEY)"
        }
    }
    
    // Storyboard related constant values
    static let viewController = "VC"
    static let inputViewController = "InputVC"
    static var VIDEOCELL_ID = "VideoCell"
}

