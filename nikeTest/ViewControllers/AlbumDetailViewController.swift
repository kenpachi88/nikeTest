//
//  AlbumDetailViewController.swift
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import UIKit
class AlbumDetailViewController: UIViewController {
    var album: Album?
    override func loadView() {
        let contentView = AlbumDetailView(frame: .zero)
        contentView.album = album
        contentView.configureDetails()
        contentView.itunesButton.addTarget(self, action: #selector(openInItunes), for: .touchUpInside)
        view = contentView
    }
   @objc func openInItunes() {
        guard let urlString = album?.url else {return}
    guard let itunesURL = URL(string: urlString) else {print("error in url itunes"); return}
        UIApplication.shared.open(itunesURL, options: [:], completionHandler: nil)
    }
}
