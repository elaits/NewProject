//
//  PhotoCollectionViewCell.swift
//  NewProject
//
//  Created by user on 6/28/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func setPhotoTitle(_ photo: PhotoModel) {
        photoTitle.text = String(photo.title)
    }

    func setPhotoCell(_ photo: PhotoModel) {
        guard let url = URL(string: photo.thumbnailUrl ) else { return }
                DispatchQueue.global().async {
                    do
                    {
                        let data = try Data(contentsOf: url)
                        DispatchQueue.main.async { [weak self] in
                            self?.photoImageView.image = UIImage(data: data)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
    }
}
