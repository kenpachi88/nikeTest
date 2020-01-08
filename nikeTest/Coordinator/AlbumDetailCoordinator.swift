//
//  AlbumDetailCoordinator.swift
//  nikeTest
//
//  Created by NYCDOE on 1/8/20.
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var albumDetailViewController: AlbumDetailViewController?
    private let album: Album
    
    init(presenter: UINavigationController, album: Album) {
        self.presenter = presenter
        self.album = album
    }
    
    func startUp() {
        let albumDetailViewController = AlbumDetailViewController()
        albumDetailViewController.album = album
        self.albumDetailViewController = albumDetailViewController
        
        presenter.pushViewController(albumDetailViewController, animated: true)
    }
}
