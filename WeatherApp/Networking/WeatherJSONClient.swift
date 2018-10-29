//
//  WeatherJSONClient.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

/// All of the Fixit endpoints return a [String : Any] json object
typealias JSONCompletionHandler = (Result<[String : Any]>)->()

/// Types that conform to this can return results from the StarWars JSON API
protocol WeatherJSONClient {
    
    func handle(result: Result<Any>, completionHandler: JSONCompletionHandler)
    func handleSuccessfulAPICall(for json: Any, completionHandler: JSONCompletionHandler)
    func handleFailedAPICall(for error: Error, completionHandler: JSONCompletionHandler)
}

extension WeatherJSONClient {
    
    func handle(result: Result<Any>, completionHandler: JSONCompletionHandler) {
        switch result {
        case .success(let json):
            self.handleSuccessfulAPICall(for: json, completionHandler: completionHandler)
        case .failure(let error):
            self.handleFailedAPICall(for: error, completionHandler: completionHandler)
        }
    }
    
    func handleSuccessfulAPICall(for json: Any, completionHandler: JSONCompletionHandler) {
        
        guard let json = json as? [String : Any] else {
            let error = NetworkingError.unknownError
            handleFailedAPICall(for: error, completionHandler: completionHandler)
            return
        }
        
        completionHandler(Result.success(json))
    }
    
    
    func handleFailedAPICall(for error: Error, completionHandler: JSONCompletionHandler) {
        completionHandler(Result.failure(error))
    }
}
