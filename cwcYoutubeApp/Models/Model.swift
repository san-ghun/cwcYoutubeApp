//
//  Model.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/13.
//

import Foundation

/// Protocol for Model object to set delegate
protocol ModelDelegate {
    func videosFetched(_ videos: [Video])
    func pageInfoFetched(_ pageInfo: [String: Any])
}

/**
 Model object get videos data in JSON format via API and decode into `[Video()]`
 */
class Model {
    
    var delegate: ModelDelegate?
    
    /// A method to get videos data and decode into a list of video objects and fetch to delegate.
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.shared.API_URL)
        
        guard url != nil else { return }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there are any errors
            if error != nil || data == nil {
                //dump(error!.localizedDescription)
                return
            }
            
            do {
                
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                // Make a dict to prepare fetch page information
                let pageInfo: [String: Any] = [
                    "prevPageToken": response.prevPageToken,
                    "nextPageToken": response.nextPageToken,
                    "totalResults": response.totalResults ?? 0
                ]
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                        
                        // Call the "pageInfoeFetched" method of the delegate
                        self.delegate?.pageInfoFetched(pageInfo)
                    }
                }
                
                
                //dump(response)
            }
            catch {
                
            }
            
        }
        
        // Fire off the task
        dataTask.resume()
        
    }
}
