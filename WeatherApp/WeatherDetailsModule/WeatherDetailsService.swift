//
//  WeatherDetailsService.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import Foundation

class UniversityRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = ["": ""]
    
    init(name: String) {
        parameters["name"] = name
    }
}
