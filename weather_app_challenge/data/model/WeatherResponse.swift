//
//  WeatherResponse.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import Foundation
import ObjectMapper

final class WeatherResponse: Mappable {
  
  var id: Int!
  var weather: String!
  var description: String!
  var icon: String!
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    weather <- map["main"]
    description <- map["description"]
    icon <- map["icon"]
  }
}
