//
//  ImageDownloader.swift
//  Delegate
//
//  Created by Ben Saratikyan on 3/21/20.
//  Copyright © 2020 Ben Saratikyan. All rights reserved.
//

import UIKit

protocol ImageDownloaderDelegate: AnyObject {
    func didFinishDownloading(_ sender: ImageDownloader?)
}

class ImageDownloader {
    var imageURL: URL?
    var image: UIImage?
    
    weak var delegate: ImageDownloaderDelegate?
    
    init(imageURL: String) {
        self.imageURL = URL(string: imageURL)
    }
    
    func downloadImage() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            if let url = self.imageURL {
                let imageData = try! Data(contentsOf: url)
                self.image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    self.delegate?.didFinishDownloading(self)
                }
            } else {
                print("Invalid URL!")
            }
        }
    }
    
}
