//
//  MoviesBusinessLogic.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
import RxSwift

class MoviesBusinessLogic: MoviesProtocol {
    
    var moviesRepository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        moviesRepository = repository
    }
    
    init() {
        moviesRepository = MoviesRepository()
    }
    
    func getMovies(page: String) throws -> Observable<ResponseTDMEntity> {
        return try moviesRepository.getMovies(page: page).asObservable().flatMap({response -> Observable<ResponseTDMEntity> in
            Observable.just(response)
        })
    }
    
}
