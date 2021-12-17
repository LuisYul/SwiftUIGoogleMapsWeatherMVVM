//
//  WeatherResponse.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import Foundation
import ObjectMapper

final class ApiWeatherResponse: Mappable {
  var coordinates: CoordinatesResponse!
  var weathers: [WeatherResponse]!
  var base: String!
  var weatherInfos: WeatherInfoResponse!
  var visibility: Int!
  var dataCalculation: Double!
  var id: Int!
  var name: String!
  var code: Int!
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    coordinates <- map["coord"]
    weathers <- map["weather"]
    base <- map["base"]
    weatherInfos <- map["main"]
    visibility <- map["visibility"]
    dataCalculation <- map["dt"]
    id <- map["id"]
    name <- map["name"]
    code <- map["cod"]
  }
    

    func mapToEntity() -> WeatherEntity {
        return WeatherEntity(
            name: name,
            temperature: Converter.convertKelvinToCelsius(kelvin: weatherInfos.temperature),
            pressure: weatherInfos.pressure,
            humidity: weatherInfos.humidity,
            minimalTemperature: weatherInfos.maximalTemperature,
            maximalTemperature: weatherInfos.maximalTemperature
        )
    }
}
