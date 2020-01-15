//
//  AlbumListCoordinator.swift
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import Foundation
import UIKit

class AlbumListCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    private var albumListViewController : AlbumListViewController?
    private var albumDetailCoordinator  : AlbumDetailCoordinator?
    private var albums: [Album]
    
    init(presenter: UINavigationController, albums: [Album]) {
        self.presenter = presenter
        self.albums = albums
    }
    func startUp() {
        let albumListViewController = AlbumListViewController()
        albumListViewController.albums   = albums
        albumListViewController.delegate = self
        
        self.albumListViewController = albumListViewController
        presenter.pushViewController(albumListViewController, animated: true)
    }
}
extension AlbumListCoordinator: AlbumListViewControllerDelegate {
    
    func albumListViewController(_ controller: AlbumListViewController, didSelect album: Album) {
        let albumDetailCoordinator = AlbumDetailCoordinator(presenter: presenter, album: album)
        self.albumDetailCoordinator = albumDetailCoordinator
        albumDetailCoordinator.startUp()

    }
    
}
