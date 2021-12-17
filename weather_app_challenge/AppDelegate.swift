//
//  AppDelegate.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import Foundation
import UIKit
import GooglePlaces
import GoogleMaps

class AppDelegate: UIResponder, UIApplicationDelegate {
    
     var locationManager = CLLocationManager()
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            GMSServices.provideAPIKey("API_KEY_HERE")
            return true
        }
    
}
