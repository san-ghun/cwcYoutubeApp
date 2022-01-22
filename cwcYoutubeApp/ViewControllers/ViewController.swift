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
    
    var model = Model()
    var videos = [Video]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.videos.count == 0 {
            self.navbarTitle.title = "No vidoes to play"
        } else {
            self.navbarTitle.title = ""
        }
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
        let inputVC = storyboard?.instantiateViewController(withIdentifier: Constants.inputViewController) as? InputViewController
        view.window?.rootViewController = inputVC
        view.window?.makeKeyAndVisible()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Sest the returned videos to the video property
        self.videos = videos
        
        // Refresh the tableView
        tableView.reloadData()
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
