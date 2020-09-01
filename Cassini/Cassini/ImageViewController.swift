//
//  ImageViewController.swift
//  Cassini
//
//  Created by Mukhtar Yusuf on 7/20/20.
//  Copyright © 2020 Mukhtar Yusuf. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    // MARK: Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARK: Variables
    var imageView = UIImageView()
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    // MARK: ScrollView Delegate Methods
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
