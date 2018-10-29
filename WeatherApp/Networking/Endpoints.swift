//
//  APIRequest.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

enum WeatherDataEndpoint: AlamofireEndpoint {
    
    case weather(latitude: String, longitude: String)

    func provideValues() -> (url: String,
                            httpMethod: HTTPMethod,
                            parameters:[String:Any]?,
                            encoding: ParameterEncoding) {
        
        switch self {
            
        case let .weather(latitude: lat, longitude: long):
            let params = parametersLogin(latitude: lat, longitude: long)
            return (url: Constants.Endpoint.Weather,
                    httpMethod: .post,
                    parameters: params,
                    encoding: URLEncoding.default)
            
        }
    }
    
    private func parametersLogin(latitude: String,
                                 longitude: String) -> [String : String] {
        return [
            "lat" : String(latitude),
            "lon" : String(longitude),
            "APPID" : Constants.Key.AppID
        ]
    }
}
