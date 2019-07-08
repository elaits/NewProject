//
//  PhotoCollectionViewCell.swift
//  NewProject
//
//  Created by user on 6/28/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func setPhotoCell(_ photo: PhotoModel) {
        activityIndicator.startAnimating()
        
        guard let url = URL(string: photo.thumbnailUrl ) else { return }
        DispatchQueue.global().async {
            do
            {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async { [weak self] in
                    self?.photoImageView.image = UIImage(data: data)
                    self!.activityIndicator.stopAnimating()
                    self!.activityIndicator.alpha = 0
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        photoTitle.text = photo.title
    }
}

