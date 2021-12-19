//
//  WeatherContentView.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import SwiftUI
import GoogleMaps

struct MapContentView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    @State static var cities = City.samples

    @State var markers: [CustomMarker] = cities.map {
      let marker = CustomMarker(position: $0.coordinate)
      marker.title = $0.name
      return marker
    }
    
    @State var zoomInCenter: Bool = false
    @State var expandList: Bool = false
    @State var selectedMarker: CustomMarker?
    @State var yDragTranslation: CGFloat = 0
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var showPopUp = false
    
    var body: some View {

      let scrollViewHeight: CGFloat = 80
        
      GeometryReader { geometry in
        ZStack(alignment: .top) {
          MapViewControllerBridge(markers: $markers, selectedMarker: $selectedMarker, onAnimationEnded: {
                self.zoomInCenter = true
            }
          )
            
          if $viewModel.showModal.wrappedValue {
              popUpView()
          }
        
          CitiesList(markers: $markers) { (marker) in
            guard self.selectedMarker != marker else { return }
            self.selectedMarker = marker
            self.zoomInCenter = false
            self.expandList = false
              
            let position = marker.position
            viewModel.getWeather(lat: position.latitude, lng: position.longitude)
            print("name click", marker.title ?? "")
              
            self.showPopUp = true
             
          }  handleAction: {
            self.expandList.toggle()
          }.background(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .offset(
            x: 0,
            y: geometry.size.height - (expandList ? scrollViewHeight + 150 : scrollViewHeight)
          )
          .offset(x: 0, y: self.yDragTranslation)
          .animation(.spring())
          .gesture(
            DragGesture().onChanged { value in
              self.yDragTranslation = value.translation.height
            }.onEnded { value in
              self.expandList = (value.translation.height < -120)
              self.yDragTranslation = 0
            }
          )
          .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
      }
    }
      
    private func popUpView() -> some View {
        VStack (alignment: .leading, spacing : 10) {
           HStack {
               Text("Weather in").font(Font.custom("Avenir-Black", size: 16.0))
               Text(selectedMarker?.title ?? "").font(Font.custom("Avenir-Black", size: 18.0))
           }
           .frame(alignment: .center)
           Divider()
            HStack {
                let tempInt = $viewModel.weatherEntity.temperature.wrappedValue ?? 0
                let nf = NumberFormatter()
                let tempString = nf.string(from: NSNumber(value: tempInt)) ?? "--"
                Text("Temperatura: \(tempString)ºC")
            }
            HStack {
                let humInt = $viewModel.weatherEntity.humidity.wrappedValue ?? 0
                let humString = humInt == 0 ? "" : "\(humInt)"
                Text("Humedad: \(humString)")
            }
            HStack {
                let pressInt = $viewModel.weatherEntity.pressure.wrappedValue ?? 0
                let pressString = pressInt == 0 ? "" : "\(pressInt)"
                Text("Presión: \(pressString)")
            }
        }
        .padding()
        .frame(width: 240, height: 170, alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20 )
    }
  }

struct CitiesList: View {

    @Binding var markers: [CustomMarker]
    var buttonAction: (CustomMarker) -> Void
    var handleAction: () -> Void
    @State private var searchText = ""

    var body: some View {
      GeometryReader { geometry in
        VStack(spacing: 0) {
          HStack(alignment: .center) {
            Rectangle()
              .frame(width: 25, height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
              .cornerRadius(10)
              .opacity(0.25)
              .padding(.vertical, 8)
          }
          .frame(width: geometry.size.width, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .onTapGesture {
            handleAction()
          }
          List {
              SearchBar(text: $searchText)
              ForEach(self.markers.filter({ searchText.isEmpty ? true : $0.title!.contains(searchText) })) { item in
                  Button(action: {
                      buttonAction(item)
                  }) {
                      Text(item.title ?? "")
                  }
              }
          }.frame(maxWidth: .infinity)
        }
      }
    }
}


