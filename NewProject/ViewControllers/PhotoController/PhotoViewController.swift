//
//  ViewController.swift
//  UICollectionView
//
//  Created by user on 6/24/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    private var photos = [PhotoModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.photoCollectionView.reloadData()
            }
        }
    }
    var albumId : Int! {
        didSet {
            PhotoService.fetchPhotos(albumId: albumId) { (photos) in
                self.photos = photos
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
    }
    
    func setPhoto(_ photo: [PhotoModel]) {
        self.photos = photo
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell {
            itemCell.setPhotoCell(photos[indexPath.row])
            return itemCell
            
        } else { fatalError() }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myModalViewController = storyboard.instantiateViewController(withIdentifier: "modalVC") as? ThumbnailViewController
        myModalViewController?.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        myModalViewController?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present((myModalViewController ?? nil)!, animated: true, completion: nil)
        
        myModalViewController?.setThumbnailPhoto(photos[indexPath.row])
    }
    
}
