//
//  WeatherViewModel.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import Foundation
import RxSwift

final class WeatherViewModel: ObservableObject {
        
    private var getWeatherUseCase: GetWeatherUseCase
    
    init(getWeatherUseCase: GetWeatherUseCase) {
        self.getWeatherUseCase = getWeatherUseCase
    }
    
    @Published var weatherEntity = WeatherEntity()
    var showModal : Bool = false
    
    private let disposeBag: DisposeBag = DisposeBag()
        
    func getWeather(lat: Double, lng: Double) {
        getWeatherUseCase.call(from: [lat, lng])
            .subscribe(onNext: {
                self.weatherEntity = $0
                self.showModal = true
            }, onError: {
                print($0.localizedDescription)
            }
        ).disposed(by: disposeBag)
    }
    
}
