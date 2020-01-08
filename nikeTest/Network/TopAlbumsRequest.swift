//
//  WebService.swift
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import Foundation


extension URLSession {
    private func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case (200...299):
                    print("HTTP Success")
                default:
                    print("\(httpResponse.statusCode)  error")
                }
            }
            
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func topAlbumsTask(with url: URL, completionHandler: @escaping (FeedResult?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
