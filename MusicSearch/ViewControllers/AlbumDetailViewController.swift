//
//  AlbumDetailViewController.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UITableViewController {
    
    static let cellIdentifier = "default_cell"
    let album : DZAlbum
    var tracks : [DZTrack]?
    
    init(album: DZAlbum) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
        
        self.title = "\(album.title) Album"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TrackCell.self, forCellReuseIdentifier: AlbumDetailViewController.cellIdentifier)
        tableView.backgroundColor = .black
        tableView.allowsSelection = false
        
        let headerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 320))
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        headerImageView.sd_setImage(with: album.largeImageURL, completed: nil)
        tableView.tableHeaderView = headerImageView
        
        DZAPIClient.tracks(forAlbum: album.albumId) { (tracks, error) in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.tracks = tracks
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: DataSource
extension AlbumDetailViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumDetailViewController.cellIdentifier, for: indexPath) as! TrackCell
        if let track = tracks?[indexPath.row] {
            cell.configure(track: track)
        }
        return cell
    }
}
