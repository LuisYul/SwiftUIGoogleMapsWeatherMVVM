//
//  City.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import CoreLocation

struct City {
  var name: String
  var coordinate: CLLocationCoordinate2D
}

extension City {
  static let samples = [
    City(name: "Arequipa", coordinate: CLLocationCoordinate2D(latitude: -16.405237, longitude: -71.533548)),
    City(name: "Cusco", coordinate: CLLocationCoordinate2D(latitude: -13.529549, longitude: -71.967194)),
    City(name: "Ayacucho", coordinate: CLLocationCoordinate2D(latitude: -13.165244, longitude: -74.221466)),
    City(name: "Lima", coordinate: CLLocationCoordinate2D(latitude: -12.051450, longitude: -77.038602)),
    City(name: "Cajamarca", coordinate: CLLocationCoordinate2D(latitude: -7.165233, longitude: 139.6004407)),
    City(name: "Piura", coordinate: CLLocationCoordinate2D(latitude: -5.185392, longitude: -80.652044))
  ]
}
