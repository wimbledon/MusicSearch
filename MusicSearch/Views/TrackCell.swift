//
//  TrackCell.swift
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

import UIKit

class TrackCell : UITableViewCell {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let numberLabel = UILabel()
    let durationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .white
        subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subtitleLabel.textColor = .gray
        numberLabel.font = .preferredFont(forTextStyle: .headline)
        numberLabel.textColor = .white
        durationLabel.font = .preferredFont(forTextStyle: .subheadline)
        durationLabel.textColor = .gray
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(durationLabel)
        
        let views = ["tv" : titleLabel, "sv" : subtitleLabel, "nv" : numberLabel, "dv" : durationLabel]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[nv]-[tv]",
                                                                  options: [],
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[nv]-[sv]",
                                                                  options: [],
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[dv]-|",
                                                                  options: [],
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tv][sv]-|",
        options: [],
        metrics: nil,
        views: views))
        
        NSLayoutConstraint.activate([
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            durationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        numberLabel.text = nil
        durationLabel.text = nil
    }
    
    func configure(track: DZTrack) {
        titleLabel.text = track.title
        subtitleLabel.text = track.subtitle
        numberLabel.text = "\(track.position)."
        durationLabel.text = DateComponentsFormatter().string(from: track.duration)
    }
}
