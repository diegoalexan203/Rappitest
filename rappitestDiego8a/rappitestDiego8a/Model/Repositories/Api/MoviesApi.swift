//
//  MoviesApi.swift
//  rappitestDiego8a
//
//  Created by Diego Ochoa on 31/01/22.
//

import Foundation
import Moya

public enum MoviesApi {
    case getMovies(page: String, key: String)
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
        case let .getMovies(page, key):

            return .requestParameters(parameters: ["page": page, "api_key": key], encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/4")!
    }

    public var path: String {
        switch self {
        case .getMovies:
            return "/list/1"
        }
    }
}
