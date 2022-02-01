//
//  ResponseTDMEntity.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
struct ResponseTDMEntity: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
}
