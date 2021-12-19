//
//  weather_app_challengeApp.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import SwiftUI
import GoogleMaps
import GooglePlaces

@main
struct weather_app_challengeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let mainContainer = MainContainer.sharedContainer.container
    
    var body: some Scene {
        WindowGroup {
            MapContentView(viewModel: mainContainer.resolve(WeatherViewModel.self)!)
        }
    }
    
}
