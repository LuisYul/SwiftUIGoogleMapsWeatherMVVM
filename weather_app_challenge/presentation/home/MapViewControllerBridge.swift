//
//  MapContentView.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 16/12/21.
//

import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
  @Binding var markers: [CustomMarker]
  @Binding var selectedMarker: CustomMarker?
  var onAnimationEnded: () -> ()

  func makeUIViewController(context: Context) -> MapViewController {
    // Replace this line
    return MapViewController()
  }

  func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
      markers.forEach { $0.map = uiViewController.map }
      selectedMarker?.map = uiViewController.map
      animateToSelectedMarker(viewController: uiViewController)
  }
    
    private func animateToSelectedMarker(viewController: MapViewController) {
        guard let selectedMarker = selectedMarker else {
          return
        }

        let map = viewController.map
        if map.selectedMarker != selectedMarker {
          map.selectedMarker = selectedMarker
         
              map.animate(with: GMSCameraUpdate.setTarget(selectedMarker.position))
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                map.animate(toZoom: 14)
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                // Invoke onAnimationEnded() once the animation sequence completes
                                onAnimationEnded()
                              })
              })
          
        }
      }
}

