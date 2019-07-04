//
//  PhotoService.swift
//  NewProject
//
//  Created by user on 7/1/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class PhotoService {
    static var path = "photos"
    static let errorClosure: (Error) -> Void = {
        print($0)
    }
    
    static func fetchPhotos(albumId: Int, completion: @escaping ([PhotoModel])->Void){
        let params = ["albumId": "\(albumId)"]
  
        NetworkManager.fetch(path: path, params: params, failure: errorClosure) { (data) in
            do {
                let photos = try JSONDecoder().decode([PhotoModel].self, from: data)
                completion(photos)
            } catch {
                print("error: ",error.localizedDescription)
            }
        }
    }
}
