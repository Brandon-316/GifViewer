//
//  JSONDownloader.swift
//  GifViewer
//
//  Created by Brandon Mahoney on 8/22/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit


class JSONDownloader {
    
    let apiKey = "yOHb92FVQbdrciNhA785mewtS77OpZ8v"
    typealias GiffyCompletionHandler = (Gifs?, Error?) -> Void
    
    // With downloadTask
    func downloadGifs(completion:@escaping GiffyCompletionHandler) {
        
        let url = URL(string: "https://api.giphy.com/v1/gifs/trending?api_key=\(apiKey)")!
        var gifs: Gifs = Gifs.init(data: [])
        
        let session: URLSession = URLSession.shared
        
        let task: URLSessionDownloadTask = session.downloadTask(with: url) { urlLocation, urlResponse, error in

            if let error = error {
                completion(nil, error)
            }

            if let urlLocation = urlLocation {
                if let data = try? Data(contentsOf: urlLocation) {

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    gifs = try! decoder.decode(Gifs.self, from: data)

                }

                completion(gifs, nil)
            }

        }
        task.resume()
    }
    
    
    
    // With dataTask
    func refreshGifs(completion:@escaping GiffyCompletionHandler) {
        
        let url = URL(string: "https://api.giphy.com/v1/gifs/trending?api_key=\(apiKey)")!
        var gifs: Gifs = Gifs.init(data: [])
        
        let session: URLSession = URLSession.shared
        
        let task: URLSessionDataTask = session.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(nil, error)
            }

            if let data = data {

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    gifs = try! decoder.decode(Gifs.self, from: data)

                completion(gifs, nil)
            }

        }
        task.resume()
    }
    
    
}













