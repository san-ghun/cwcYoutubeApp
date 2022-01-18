//
//  Constants.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/13.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLdgUERwLEXZiwxTtSiiQYWTrjjxhFx06i"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}

