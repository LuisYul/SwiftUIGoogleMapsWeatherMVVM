//
//  WeatherInfoResponse.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import Foundation
import ObjectMapper

final class WeatherInfoResponse: Mappable {
  
  var temperature: Double!
  var pressure: Int!
  var humidity: Int!
  var minimalTemperature: Double!
  var maximalTemperature: Double!
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    temperature <- map["temp"]
    pressure <- map["pressure"]
    humidity <- map["humidity"]
    minimalTemperature <- map["temp_min"]
    maximalTemperature <- map["temp_max"]
  }
  
}

