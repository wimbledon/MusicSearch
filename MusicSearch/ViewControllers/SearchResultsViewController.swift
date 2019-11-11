//
//  SearchResultsViewController.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class SearchResultsViewController: UITableViewController {
    
    static let cellIdentifier = "default_cell"
    var artists : [DZArtist]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        tableView.register(ArtistCell.self, forCellReuseIdentifier: SearchResultsViewController.cellIdentifier)
    }
    
    func reloadArtists(artists: [DZArtist]?) {
        self.artists = artists
        tableView.reloadData()
    }
}

// MARK: DataSource
extension SearchResultsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsViewController.cellIdentifier, for: indexPath) as! ArtistCell
        if let artist = artists?[indexPath.row] {
            cell.configure(artist: artist)
        }
        return cell
    }
}

// MARK: Delegate
extension SearchResultsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultsViewController.cellIdentifier, for: indexPath)
        cell.setHighlighted(false, animated: true)
        
        if let artist = artists?[indexPath.row] {
            let albumsVC = AlbumsViewController(artist: artist)
            self.parent?.presentingViewController?.navigationController?.pushViewController(albumsVC, animated: true)
        }
    }
}
