//
//  ViewController.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navbarTitle: UINavigationItem!
    @IBOutlet weak var gearButton: UIBarButtonItem!
    
    @IBOutlet weak var prevPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var pageLabel: UILabel!
    
    var model = Model()
    var videos = [Video]()
    
    var prevPageToken = ""
    var nextPageToken = ""
    var totalResults: Int?
    var currentPageNumber = 1
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.getVideos()
    
        self.navbarTitle.title = "Oops, Plaese check key and id again"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else { return }
        
        // Get a reference to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    // MARK: - Methods
    
    // MARK: IBActions
    @IBAction func didTappedGearButton(_ sender: Any) {
        
        self.videos = [Video]()
        
        let inputVC = storyboard?.instantiateViewController(withIdentifier: Constants.inputViewController) as? InputViewController
        view.window?.rootViewController = inputVC
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func didTappedPrevButton(_ sender: Any) {
        Constants.shared.PAGE_TOKEN = prevPageToken
        currentPageNumber -= 1
        
        model.getVideos()
    }
    
    @IBAction func didTappedNextButton(_ sender: Any) {
        Constants.shared.PAGE_TOKEN = nextPageToken
        currentPageNumber += 1
        
        model.getVideos()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Sest the returned videos to the video property
        self.videos = videos
        
        // Refresh the tableView
        tableView.reloadData()
        
        if self.videos.count == 0 {
            self.navbarTitle.title = "No video in list"
        } else {
            self.navbarTitle.title = "PlayList"
        }
    }
    
    func pageInfoFetched(_ pageInfo: [String : Any]) {
        
        self.prevPageToken = pageInfo["prevPageToken"] as! String
        
        self.nextPageToken = pageInfo["nextPageToken"] as! String
        
        self.totalResults = pageInfo["totalResults"] as? Int
        
        if self.prevPageToken == "" {
            self.prevPageButton.isEnabled = false
        } else {
            self.prevPageButton.isEnabled = true
        }
        
        if self.nextPageToken == "" {
            self.nextPageButton.isEnabled = false
        } else {
            self.nextPageButton.isEnabled = true
        }
        
        pageLabel.text = { () -> String in
            let result: String
            
            var temp = Double(totalResults!) / Double(Constants.shared.MAX_RESULTS)
            temp = ceil(temp)
            
            result = "\(currentPageNumber)/\(Int(temp))"
            
            return result
        }()
        
    }
    
    // MARK: - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
