//
//  AlbumCell.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class AlbumCell : UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .white
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .gray
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        let views = ["iv" : imageView, "tv" : titleLabel, "sv" : subtitleLabel]
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[iv]-[tv][sv]|",
                                                                  options:[],
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[iv]|",
                                                                  options:[],
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tv]|",
                                                                  options:[],
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[sv]|",
                                                                  options:[],
                                                                  metrics: nil,
                                                                  views: views))
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        subtitleLabel.text = nil
        imageView.sd_cancelCurrentImageLoad()
    }
    
    func configure(album: DZAlbum) {
        titleLabel.text = album.title
        subtitleLabel.text = "album"
        imageView.sd_setImage(with: album.largeImageURL,
                              placeholderImage: UIImage.init(named: "albumPlaceholder"),
                              options: .allowInvalidSSLCertificates,
                              completed: nil)
    }
}
