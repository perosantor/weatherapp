//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Petar Santor on 10/29/18.
//  Copyright © 2018 Apptisan. All rights reserved.
//

import ObjectMapper

struct WeatherDetails: Mappable {
    
    var temperature: String!
    var humidity: String!
    var pressure: String!
    
    var desc: String {
        return "Temperature: \(String(describing: temperature)) /nHumidity: \(String(describing: humidity)) /nPresssure: \(String(describing: pressure))"
    }
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        temperature <- map["temperature"]
        humidity <- map["humidity"]
        pressure <- map["pressure"]
    }
    
    static func parseWeatherDetails(from json: [String : Any]) -> WeatherDetails? {
        var result: WeatherDetails?
        if let jsonWD = json["social_tokens"] as? [String: Any] {
            result = Mapper<WeatherDetails>().map(JSONObject: jsonWD)
        }
        return result
    }
    
    init() {}
    
    init(temperature: String! = "0",
         humidity: String! = "0",
         pressure: String! = "0") {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }
}
