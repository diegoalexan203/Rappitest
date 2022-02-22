//
//  DefaultAlamofireManager.swift
//  rappitestDiego8a
//
//  Created by Diego Ochoa on 31/01/22.
//

import Alamofire
import Foundation
import Moya
import RxSwift

public class DefaultAlamofireManager: Alamofire.Session {
    
  public  static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForResource = 20
        configuration.timeoutIntervalForRequest = 20
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
    
}
