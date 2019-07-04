//
//  AlbumTableViewController.swift
//  NewProject
//
//  Created by user on 6/28/19.
//  Copyright © 2019 Razeware. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    var albumId = 0
    var showAlbumSegueName = "ShowAlbum"
    var albums = [AlbumModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlbumService.fetchAlbums { [weak self] (albums) in
            self?.albums = albums
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showAlbumSegueName {
            guard let PhotosController = segue.destination as? PhotoViewController else { return }
            PhotosController.albumId = albumId
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return albums.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.className, for: indexPath) as? AlbumTableViewCell else { return UITableViewCell() }
        cell.setCell(albums[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        albumId = indexPath.row + 1
        performSegue(withIdentifier: showAlbumSegueName, sender: albumId)
    }
    
}
