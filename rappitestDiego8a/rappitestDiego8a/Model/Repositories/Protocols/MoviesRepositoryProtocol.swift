//
//  MoviesRepositoryProtocol.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
import RxSwift

protocol MoviesRepositoryProtocol {
    func getMovies(page: String) throws -> Observable<ResponseTDMEntity>
}
