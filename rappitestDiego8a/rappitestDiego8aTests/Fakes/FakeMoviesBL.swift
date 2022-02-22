//
//  FakeMoviesBL.swift
//  rappitestDiego8aTests
//
//  Created by Diego Ochoa on 21/02/22.
//

import Foundation
@testable import rappitestDiego8a
import RxCocoa
import RxSwift
import RxTest
import XCTest

class FakeMoviesBL: MoviesBusinessLogic {
    override init() {
        super.init()
    }
    
    override func getMovies(page: String) throws -> Observable<ResponseTDMEntity> {
        let response = ResponseTDMEntity(id: 1, name: "Marvel", page: 1, posterPath: "asfasf.jpg", results: [MoviesEntity(backdropPath: "adfdfd.jpg", id: 1, originalTitle: "Rapido y Furioso", overview: "Rapido y Furioso", posterPath: "Rapido y Furioso", releaseDate: "2015", title: "adfdfd.jpg", video: false), MoviesEntity(backdropPath: "adfdfd.jpg", id: 2, originalTitle: "Matrix", overview: "Matrix", posterPath: "Matrix", releaseDate: "2000", title: "adfdfd.jpg", video: false)], totalPages: 1, totalResults: 2)

        return Observable<ResponseTDMEntity>.from(optional: response)
    }
}
