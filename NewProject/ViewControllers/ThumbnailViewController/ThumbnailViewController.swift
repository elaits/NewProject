//
//  ThumbnailViewController.swift
//  NewProject
//
//  Created by user on 7/1/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class ThumbnailViewController: UIViewController {
    @IBOutlet weak var thumbnailPhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeThumbnail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setThumbnailPhoto(_ photo: PhotoModel) {
        if let url = URL(string: photo.url) {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                if let data = data {
                    DispatchQueue.main.async { [weak self] in
                        self?.thumbnailPhotoView.image = UIImage(data: data)
                    }
                }
                }.resume()
        }
    }
}
