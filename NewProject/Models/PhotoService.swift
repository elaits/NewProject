//
//  PhotoService.swift
//  NewProject
//
//  Created by user on 7/1/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class PhotoService {
    static let path = "photos"
    
    static func fetchPhotos(albumId: Int, completion: @escaping ([PhotoModel])->Void){
        NetworkManager.fetch(path: path) { (data) in
            do {
                var photos = try JSONDecoder().decode([PhotoModel].self, from: data)
                photos = photos.filter{$0.albumId == albumId}
                completion(photos)
            } catch {
                print("error: ",error.localizedDescription)
            }
        }
    }
}
