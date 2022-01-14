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
        //let url = URL(string: Constants.API_URL)
        let url = URL(string: ConstantsTemplate.API_URL)
        
        guard url != nil else { return }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there are any errors
            if error != nil || data == nil {
                return
            }
            
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }
            
        }
        
        // Fire off the task
        dataTask.resume()
        
    }
}
