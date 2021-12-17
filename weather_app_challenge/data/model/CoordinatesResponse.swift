//
//  CoordinatesResponse.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import ObjectMapper

final class CoordinatesResponse: Mappable {
  
  var latitude: Double!
  var longitude: Double!
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    latitude <- map["lat"]
    longitude <- map["lon"]
  }
  
}
