//
//  Delegates.swift
//  nikeTest
//
//  Created by NYCDOE on 1/8/20.
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import Foundation

protocol AlbumListViewControllerDelegate: class {
    func albumListViewController(_ controller: AlbumListViewController, didSelect album: Album)

}
