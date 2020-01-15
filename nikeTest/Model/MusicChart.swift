//
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import Foundation
import UIKit


typealias Album = Result
var topAlbums = [Album]()

// MARK: - MusicChart
struct MusicChart: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let results: [Result]
}


// MARK: - Result
struct Result: Codable {
    let artistName, id, releaseDate, name: String
    let copyright, artistID: String
    let artistURL: String
    var artworkUrl100: String
    let genres: [Genre]
    let url: String
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, copyright, url
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres
    }
}


// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}



