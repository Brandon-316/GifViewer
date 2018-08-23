//
//  Giphy.swift
//  GifViewer
//
//  Created by Brandon Mahoney on 8/22/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation

class Giphy {
    var stillImageURL: URL?
    var animatedGifURL: URL?
    
    
    init(gif: Gif) {
        let stillImageURL = URL(string: gif.images.downsizedStill.url)
        let animatedGifURL = URL(string: gif.images.original.url)
        
        self.stillImageURL = stillImageURL
        self.animatedGifURL = animatedGifURL
    }
}


