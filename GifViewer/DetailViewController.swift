//
//  DetailViewController.swift
//  GifViewer
//
//  Created by Brandon Mahoney on 8/22/18.
//  Copyright © 2018 Brandon Mahoney. All rights reserved.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {
    
    var giphy: Giphy?
    
    
    @IBOutlet weak var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let giphy = giphy {
            guard let url = giphy.animatedGifURL else { return }
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        setupGestures()
    }

    func setupGestures() {
        let dismiss = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.tapToDismiss))
        dismiss.numberOfTapsRequired = 1
        view.addGestureRecognizer(dismiss)
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(DetailViewController.swipeToDismiss))
        swipe.direction = .right
        view.addGestureRecognizer(swipe)
    }
    
    @objc func tapToDismiss() {
        UIView.animate(withDuration: 0.75, animations: {
            self.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.view.alpha = 0.0
        }) { finished in
            self.dismiss(animated: true)
        }
    }
    
    @objc func swipeToDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.transform = CGAffineTransform(translationX: 400, y: 0)
        }) { finished in
            self.dismiss(animated: true)
        }
    }
    
}
