//
//  WeatherRepositoryImpl.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import Foundation
import RxSwift

class WeatherRepositoryImpl: WeatherRepository {
    
    private final let appServiceClient = AppServiceClient()
    
    func getWeather(from coordinates: [Double]) -> Observable<WeatherEntity> {
        return appServiceClient.getWeather(from: coordinates).map{ response in
            return response.mapToEntity()
        }
    }
}
