//
//  GetWeatherUseCase.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import Foundation
import RxSwift

final class GetWeatherUseCase {
        
    private var weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func call(from coordinates: [Double]) -> Observable<WeatherEntity> {
        weatherRepository.getWeather(from: coordinates)
    }
    
}
