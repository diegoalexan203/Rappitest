//
//  MoviesProtocol.swift
//  rappitestDiego8a
//
//  Created by Diego Ochoa on 31/01/22.
//

import Foundation
import RxSwift

protocol MoviesProtocol {
    func getMovies(page: String) throws -> Observable<ResponseTDMEntity>
}
