//
//  ArtistCell.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit
import SDWebImage

class ArtistCell : UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        textLabel?.textColor = .white
        textLabel?.font = .preferredFont(forTextStyle: .headline)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        imageView?.sd_cancelCurrentImageLoad()
    }
    
    func configure(artist: DZArtist) {
        textLabel?.text = artist.name
        imageView?.sd_setImage(with: artist.smallImageURL, placeholderImage: UIImage.init(named: "artistPlaceholder"), options: .allowInvalidSSLCertificates, completed: nil)
    }
}
