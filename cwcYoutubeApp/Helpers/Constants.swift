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
struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static let viewController = "VC"
    static let inputViewController = "InputVC"
    static var VIDEOCELL_ID = "VideoCell"
}

