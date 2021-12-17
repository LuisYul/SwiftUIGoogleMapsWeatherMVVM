//
//  WeatherRepository.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import Foundation
import RxSwift

protocol WeatherRepository {
    
    func getWeather(from coordinates: [Double]) -> Observable<WeatherEntity>
    
}
