//
//  DataModel.swift
//  GifViewer
//
//  Created by Brandon Mahoney on 8/22/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation

struct Gifs: Codable {
    let data: [Gif]
}

struct Gif: Codable {
    let images: Images
}

struct Images: Codable {
    let downsizedStill: Image
    let original: Image
}

struct Image: Codable {
    let url: String
}
