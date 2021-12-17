//
//  MapViewController.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import GoogleMaps
import SwiftUI
import UIKit

class MapViewController: UIViewController {

  let map =  GMSMapView(frame: .zero)
  var isAnimating: Bool = false

  override func loadView() {
    super.loadView()
    self.view = map
  }
}
