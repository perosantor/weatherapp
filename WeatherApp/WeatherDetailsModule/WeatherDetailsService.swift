//
//  WeatherDetailsService.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

class WeatherDetailsService: WeatherJSONClient {
    
    func fetchWeatherData(latitude:String, longitude:String, _ completionHandler: @escaping JSONCompletionHandler) {
        AlamofireJSONClient.makeAPICall(to: WeatherDataEndpoint.weather(latitude: latitude, longitude: longitude)) { (result) in
            self.handle(result: result, completionHandler: completionHandler)
        }
    }
}
