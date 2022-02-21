//
//  MoviesRepository.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
import Moya
import Alamofire
import RxSwift

class MoviesRepository: MoviesRepositoryProtocol {
    
    let officesApi = MoyaProvider<MoviesApi>(session: DefaultAlamofireManager.sharedManager)

    func getMovies(page: String) throws -> Observable<ResponseTDMEntity> {
        return officesApi.rx.request(MoviesApi.getMovies(page: page, key: "f96f41213ed563ef00b841f2fa3eed80")).asObservable().flatMap({ response -> Observable<ResponseTDMEntity> in

                     if response.statusCode == 200 {
                         do {
                             let decoder = JSONDecoder()
                             let result = try decoder.decode(ResponseTDMEntity.self, from: response.data)
                             return Observable.just(result)
                         }
                     } else {
                         let error = NSError(domain: "Error notificationsApi", code: response.statusCode, userInfo: ["Error": response.statusCode.description])
                         return Observable.error(error)
                     }
                     
                 })
      }
    
}
