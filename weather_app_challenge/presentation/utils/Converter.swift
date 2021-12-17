//
//  Converter.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 17/12/21.
//

import Foundation

final class Converter {
  public class func convertKelvinToCelsius(kelvin: Double) -> Double {
    return kelvin - metrics.kelvinConverterValue
  }
}

final class metrics {
  
  public class var kelvinConverterValue: Double {
    return 273.15
  }
}
