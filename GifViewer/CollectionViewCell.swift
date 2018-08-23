//
//  CollectionViewCell.swift
//  GifViewer
//
//  Created by Brandon Mahoney on 8/13/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var giphy: Giphy?
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setGiphy(_ giphy: Giphy?) {
        let giphy = giphy
        downloadImage(with: giphy?.stillImageURL)
    }
    
    func downloadImage(with url: URL?) {
        
        let session: URLSession = URLSession.shared
        
        guard let aUrl = url else { return }
        
        let request = URLRequest(url: aUrl, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        
        let task: URLSessionDownloadTask = session.downloadTask(with: request) { urlLocation, urlResponse, error in

            if let aLocation = urlLocation {
                if let data = try? Data(contentsOf: aLocation) {
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async(execute: {
                        self.imageView.image = image
                    })
                }
            }
        }
        task.resume()
    }
    
}
