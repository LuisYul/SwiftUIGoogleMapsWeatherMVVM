//
//  RestApiBase.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import Foundation
import Alamofire

class RestApiBase {
  var request: Alamofire.Request?
  
  let baseUrl = "https://api.openweathermap.org/data/2.5/"
  
  var parameters = ["APPID":"2d59b6f6fd3b090e08101e1133911727"]
  
  func cancelRequest() {
    request?.cancel()
  }
}
