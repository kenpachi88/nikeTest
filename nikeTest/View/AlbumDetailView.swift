//
//  AlbumDetailView.swift
//  nikeTest
//
//  Created by NYCDOE on 1/15/20.
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import UIKit

class AlbumDetailView: UIView {
    var album : Album?
    var stackView : UIStackView
    let itunesButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Open in iTunes", for: .normal)
        btn.tintColor = .white
        return btn
    }()
    let albumNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    let artistNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    let albumImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let genreLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    let releaseLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    let copyrightLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init (frame: CGRect) {
        stackView = UIStackView(arrangedSubviews: [albumImageView,albumNameLabel,artistNameLabel,genreLabel,releaseLabel,copyrightLabel,itunesButton])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        addSubview(stackView)
        albumImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        albumNameLabel.anchor(top: albumImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        artistNameLabel.anchor(top: albumNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        genreLabel.anchor(top: artistNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        releaseLabel.anchor(top: genreLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        copyrightLabel.anchor(top: releaseLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0, enableInsets: false)
        itunesButton.anchor(top: copyrightLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        
    }
    func configureDetails() {
        guard let imageURL = album?.artworkUrl as NSURL? else {return}
        albumImageView.image = imageCache.object(forKey: imageURL)
        albumNameLabel.text = album?.name
        artistNameLabel.text = album?.artistName
        let genre = String(album?.genres.map{$0.name}.joined(separator: ", ") ?? "Music")
        genreLabel.text = genre
        releaseLabel.text = album?.releaseDate
        copyrightLabel.text = album?.copyright
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //plus genre, release date, and copyright info below the image
}
