//
//  MainContainer.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 19/12/21.
//

import Foundation
import Swinject

class MainContainer {
    
    static let sharedContainer = MainContainer()
    let container = Container()
    
    private init() {
        setupDefaultContainers()
    }
    
    private func setupDefaultContainers() {
        
        container.register(AppServiceClient.self) { _ in AppServiceClient.init() }
        
        container.register(WeatherRepository.self) { resolver in
            let weatherRepository = WeatherRepositoryImpl(appServiceClient: resolver.resolve(AppServiceClient.self)!)
            return weatherRepository
        }
        
        container.register(GetWeatherUseCase.self) { resolver in
            GetWeatherUseCase(weatherRepository: resolver.resolve(WeatherRepository.self)!)
        }
        
        container.register(WeatherViewModel.self) { resolver in
            WeatherViewModel(getWeatherUseCase: resolver.resolve(GetWeatherUseCase.self)!)
        }
    }
    
}
