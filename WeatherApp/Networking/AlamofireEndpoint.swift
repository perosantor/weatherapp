//
//  AlamofireEndpoint.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation
import Alamofire

protocol AlamofireEndpoint {
    
    /// Provides all the information required to make the API call from Alamofire
    func provideValues() -> (url: String, httpMethod: HTTPMethod, parameters:[String:Any]?, encoding: ParameterEncoding)
    
    var url: URLConvertible         { get }
    var httpMethod: HTTPMethod      { get }
    var parameters: [String: Any]?  { get }
    var encoding: ParameterEncoding { get }
}

extension AlamofireEndpoint {
    
    var url: URLConvertible         { return provideValues().url }
    var httpMethod: HTTPMethod      { return provideValues().httpMethod }
    var parameters: [String: Any]?  { return provideValues().parameters }
    var encoding: ParameterEncoding { return provideValues().encoding }
}

public enum Result<T> {
    case success(T)
    case failure(Error)
}
