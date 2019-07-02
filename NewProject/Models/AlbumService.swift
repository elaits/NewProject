//
//  AlbumService.swift
//  NewProject
//
//  Created by user on 7/1/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation


class AlbumService {
    static let path = "albums"
    
    static func fetchAlbums(completion: @escaping ([AlbumModel])->Void){
        NetworkManager.fetch(path: path) { (data) in
            do {
                var albums = try JSONDecoder().decode([AlbumModel].self, from: data)
                albums = albums.sorted{$0.title < $1.title}
                albums = albums.map() {
                    AlbumModel(userId: $0.userId, id: $0.id, title: $0.title.prefix(1).uppercased() + $0.title.dropFirst())
                }
                completion(albums)
            } catch {
                print("error: ",error.localizedDescription)
            }
        }
    }
}
