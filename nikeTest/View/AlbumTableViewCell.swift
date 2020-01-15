//
//  AlbumTableViewCell.swift
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import UIKit
import Foundation
class AlbumTableViewCell: UITableViewCell {
    var album : Album?
    
    
    private let albumNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let artistNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    private let albumImageView : CustomImageView = {
        let imgView = CustomImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    func configureWithAlbum(_ album: Album) {
        albumNameLabel.text = album.name
        artistNameLabel.text = album.artistName
        albumImageView.loadImageUsingUrlString(urlString: album.artworkUrl100)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(albumNameLabel)
        addSubview(artistNameLabel)
        addSubview(albumImageView)
        
        albumImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        albumNameLabel.anchor(top: topAnchor, left: albumImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        artistNameLabel.anchor(top: albumNameLabel.bottomAnchor, left: albumImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
