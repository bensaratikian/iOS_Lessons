//
//  ViewController.swift
//  Delegate
//
//  Created by Ben Saratikyan on 3/21/20.
//  Copyright © 2020 Ben Saratikyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ImageDownloaderDelegate {
    @IBOutlet weak var imageVIew: UIImageView!
    
    var imageDownloader = ImageDownloader(imageURL: "https://www.nasa.gov/sites/default/files/images/nasaLogo-570x450.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDownloader.delegate = self
        imageDownloader.downloadImage()
    }
    
    func didFinishDownloading(_ sender: ImageDownloader?) {
        imageVIew.image = sender?.image
    }
}

