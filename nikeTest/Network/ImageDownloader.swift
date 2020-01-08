////
////  ImageDownloader.swift
////  nikeTest
////
////  Copyright © 2020 hireMeKennyChen. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//fileprivate var requests = [URLSessionTask]()
//
//fileprivate func downloadImage(forItemAtIndex index: Int)  {
//    guard let url = topAlbums[index].artworkUrl else {return}
//    guard requests.firstIndex(where: { $0.originalRequest?.url == url }) == nil else {
//        // We're already downloading the image.
//        return
//    }
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        // Perform UI changes only on main thread.
//        DispatchQueue.main.async {
//            if let data = data, let image = UIImage(data: data) {
//                self.topAlbums[index].image = image
//                // Reload cell with fade animation.
//                let indexPath = IndexPath(row: index, section: 0)
//                if self.tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
//                    self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
//                }
//            }
//        }
//    }
//    task.resume()
//    requests.append(task)
//}
//
//fileprivate func cancelDownloadingImage(forItemAtIndex index: Int) {
//    let url = items[index].url
//    // Find a task with given URL, cancel it and delete from `tasks` array.
//    guard let taskIndex = requests.index(where: { $0.originalRequest?.url == url }) else {
//        return
//    }
//    let task = requests[taskIndex]
//    task.cancel()
//    requests.remove(at: taskIndex)
//}
