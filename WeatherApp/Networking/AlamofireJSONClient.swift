//
//  APIClient.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation
import Alamofire

typealias AlamofireJSONCompletionHandler = (Result<Any>)->()

enum AlamofireJSONClient {
    
    static func makeAPICall(to endPoint: AlamofireEndpoint,
                            completionHandler:@escaping AlamofireJSONCompletionHandler) {
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
        
        let dataRequest = Alamofire.request(endPoint.url,
                                            method: endPoint.httpMethod,
                                            parameters: endPoint.parameters,
                                            encoding: endPoint.encoding,
                                            headers: headers)
        
        dataRequest.responseJSON { (response) in
            switch response.result {
            case .success(let value):
                if let status = response.response?.statusCode {
                    if status == 200 {
                        completionHandler(Result.success(value))
                    } else {
                        completionHandler(Result.failure(NetworkingError.checkErrorCode(status)))
                    }
                }
            case .failure(let error):
                completionHandler(Result.failure(error))
            }
        }
    }
}
