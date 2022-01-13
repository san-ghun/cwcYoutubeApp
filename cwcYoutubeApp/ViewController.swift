//
//  ViewController.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

