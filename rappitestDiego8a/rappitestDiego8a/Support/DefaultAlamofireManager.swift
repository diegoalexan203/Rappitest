//
//  DefaultAlamofireManager.swift
//  rappitestDiego8a
//
//  Created by Periferia on 31/01/22.
//

import Alamofire
import Foundation
import Moya
import RxSwift

public class DefaultAlamofireManager: Alamofire.Session {
    
  public  static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
    
}
