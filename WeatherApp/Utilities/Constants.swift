//
//  Constants.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Key {
        static let AppID = "cc43e5f998c48ce10cf15dbe2729347b"
        //static let AppID2 = "b36c8cc568b439d2fe0ad788995874e8"
        
//        static let Secret = "2911e59c9ab71c6bfff9b24ee05c7266"
//        //https://api.darksky.net/forecast/2911e59c9ab71c6bfff9b24ee05c7266/37.8267,-122.4233
    }
    
    struct Endpoint {
        static let BaseURL = "http://api.openweathermap.org/data/2.5"
        static let Weather = Constants.Endpoint.BaseURL + "/weather"
        
    }
}
