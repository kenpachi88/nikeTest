//
//  CustomImageView.swift
//  nikeTest
//
//  Created by NYCDOE on 1/15/20.
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSURL, UIImage>()

class CustomImageView: UIImageView {
    var imageUrlString: String?
    func loadImageUsingUrlString(urlString: String) {
        imageUrlString = urlString
        guard let url = NSURL(string: urlString) else {return}
        image = nil
        if let imageFromCache = imageCache.object(forKey: url) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, response, error) in
       guard let data = data, let response = response as? HTTPURLResponse else { return }
            
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data) else {return}
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache, forKey: url)
            }
        }).resume()
    }
    
}


