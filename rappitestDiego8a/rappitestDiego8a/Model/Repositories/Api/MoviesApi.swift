//
//  MoviesApi.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Foundation
import Moya

public enum MoviesApi {
    case getMovies ( page: String)
}

extension MoviesApi: TargetType {
    public var method: Moya.Method {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .getMovies:
              return Data()
        }
        
    }
    
    public var task: Task {
        switch self {
        case .getMovies(let page):
            return .requestParameters(parameters: [ "page": page], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getMovies:
            let headers: [String: String] = [:]
            return headers
        }
    }

    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/4")!
    }
    
    public var path: String {
    switch self {

    case .getMovies:
        return "/list/"
        
    }
    }
}
