//
//  CollectionViewController.swift
//  GifViewer
//
//  Created by Brandon Mahoney on 8/13/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit

private let reuseIdentifier = "GifViewerCell"

class CollectionViewController: UICollectionViewController {

    let apiKey = "yOHb92FVQbdrciNhA785mewtS77OpZ8v"
    private var gifs: Gifs = Gifs.init(data: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONDownloader().downloadGifs() { gifs, error in
            guard let data = gifs else { return }
            self.gifs = data
            
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
                print("Reloaded")
            }
        }
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifs.data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let gif = Giphy.init(gif: gifs.data[indexPath.row])
        
        cell.setGiphy(gif)

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destinationVC = segue.destination as! DetailViewController
            
            if let indexPath = self.collectionView?.indexPathsForSelectedItems![0] {
                let gif = Giphy.init(gif: gifs.data[indexPath.row])
                destinationVC.giphy = gif
            }
        }
    }


}
