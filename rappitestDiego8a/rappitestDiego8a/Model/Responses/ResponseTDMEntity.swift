//
//  ResponseTDMEntity.swift
//  rappitestDiego8a
//
//  Created by Diego Ochoa on 31/01/22.
//

import Foundation

struct ResponseTDMEntity: Codable {
    let id: Int
    let name: String
    let page: Int
    let posterPath: String
    let results: [MoviesEntity]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
        case name
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(id: Int, name: String, page: Int, posterPath: String, results: [MoviesEntity], totalPages: Int, totalResults: Int) {
        self.id = id
        self.name = name
        self.page = page
        self.posterPath = posterPath
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        posterPath = try values.decode(String.self, forKey: .posterPath)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        page = try values.decode(Int.self, forKey: .page)
        results = try values.decode([MoviesEntity].self, forKey: .results)

        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages) ?? 0
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults) ?? 0
    }
}
