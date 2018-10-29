//
//  NetworkingError.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

enum NetworkingError : Error {
    case unknownError
    case invalidRequest
    case invalidAPIKey
    
    static func checkErrorCode(_ errorCode: Int) -> NetworkingError {
        switch errorCode {
        case 400:
            return .invalidRequest
        case 401:
            return .invalidAPIKey
        default:
            return .unknownError
        }
    }
}
