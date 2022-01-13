//
//  Model.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/13.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else { return }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there are any errors
            if error != nil || data == nil {
                
                return
            }
            
            // Parsing the data into video objects
            
        }
        
        // Fire off the task
        dataTask.resume()
        
    }
}
