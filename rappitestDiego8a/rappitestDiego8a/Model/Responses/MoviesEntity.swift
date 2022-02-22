//
//  MoviesEntity.swift
//  rappitestDiego8a
//
//  Created by Diego on 2/02/22.
//

import Foundation

public class MoviesEntity: Codable {
    let backdropPath: String?
    let id: Int?
    let originalTitle, overview: String?
    let posterPath, releaseDate: String?
    let title: String
    let video: Bool?

    init(backdropPath: String?, id: Int?, originalTitle: String?,
         overview: String?, posterPath: String?, releaseDate: String?,
         title: String, video: Bool?) {
        self.backdropPath = backdropPath
        self.id = id
        self.originalTitle = originalTitle
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
    }

    enum CodingKeys: String, CodingKey {
        case backdropPath = "poster_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath
        case releaseDate
        case title
        case video
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        backdropPath = try values.decode(String.self, forKey: .backdropPath)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        overview = try values.decode(String.self, forKey: .overview)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        title = try values.decode(String.self, forKey: .title)
        video = try values.decode(Bool.self, forKey: .video)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle) ?? ""
    }
}
