//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

struct WeatherDetails: Codable {
    let temperature: String
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
    }
}
