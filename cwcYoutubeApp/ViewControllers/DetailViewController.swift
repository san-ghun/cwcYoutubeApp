//
//  DetailViewController.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/18.
//

import UIKit
import YouTubeiOSPlayerHelper

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var youtubePlayerView: YTPlayerView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // Check if there's a video
        guard video != nil else { return }
        
        // Load it into the Youtube player view
        self.youtubePlayerView.load(withVideoId: video!.videoId, playerVars: ["playsinline": 1])
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        // Set the description
        textView.text = video!.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
