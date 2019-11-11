//
//  AlbumsViewController.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    static let itemMargin : CGFloat = 15.0
    static let cellIdentifier = "albumCell"
    
    let artist : DZArtist
    lazy var collectionView: UICollectionView = {
        let fl = UICollectionViewFlowLayout()
        let d = (UIScreen.main.bounds.size.width - 3 * AlbumsViewController.itemMargin) / 2
        fl.itemSize = CGSize(width: d, height: d + 50)
        fl.minimumLineSpacing = AlbumsViewController.itemMargin
        fl.minimumInteritemSpacing = AlbumsViewController.itemMargin
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: fl)
        return collectionView
    }()
    
    var albums : [DZAlbum]?
    
    init(artist: DZArtist) {
        self.artist = artist
        super.init(nibName: nil, bundle: nil)
        
        self.title = "\(artist.name) Albums"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumsViewController.cellIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.contentInset = .init(top: AlbumsViewController.itemMargin,
                                            left: AlbumsViewController.itemMargin,
                                            bottom: AlbumsViewController.itemMargin,
                                            right: AlbumsViewController.itemMargin)
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        
        DZAPIClient.albums(forArtist: artist.artistId) { (albums, error) in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.albums = albums
                self.collectionView.reloadData()
            }
        }
    }
}

extension AlbumsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums?.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsViewController.cellIdentifier, for: indexPath) as! AlbumCell
        if let album = albums?[indexPath.item] {
            cell.configure(album: album)
        }
        return cell
    }
}

extension AlbumsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedAlbum = albums?[indexPath.item] {
            navigationController?.pushViewController(AlbumDetailViewController(album: selectedAlbum), animated: true)
        }
    }
}
