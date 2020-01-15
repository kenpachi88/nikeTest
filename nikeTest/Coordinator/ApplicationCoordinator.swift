//
//  ApplicationCoordinator.swift
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import Foundation
import UIKit
class ApplicationCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private var albumListCoordinator: AlbumListCoordinator?
    
    init(window: UIWindow, albums: [Album]) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        albumListCoordinator = AlbumListCoordinator(presenter: rootViewController, albums: albums)
    }
    
    func startUp() {
        window.rootViewController = rootViewController
        albumListCoordinator?.startUp()
        window.makeKeyAndVisible()
    }
    
}
