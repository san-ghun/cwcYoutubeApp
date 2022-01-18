//
//  VideoTableViewCell.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/18.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var thumbnailImageVIew: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// A method set table cell properties
    func setCell(_ v: Video) {
        
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else { return }
        
        // Set the title
        self.titleLable.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        /// reference from NSDateFormatter.com
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video?.thumbnail != "" else { return }
        
        // Check cache before download data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnail imageView
            self.thumbnailImageVIew.image = UIImage(data: cacheData)
            return
        }
        
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Check that the download url matches the video thumbnail url that this cell is currently set to display
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageView
                /// Remember that modifying user interface should be thrown to main thread, because downloading is done by background thread
                DispatchQueue.main.async {
                    self.thumbnailImageVIew.image = image
                }
            }
        }
        // Start data task
        dataTask.resume()
    }

}
