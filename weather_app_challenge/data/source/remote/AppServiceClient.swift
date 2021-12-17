//
//  AppServiceClient.swift
//  weather_app_challenge
//
//  Created by Luis Yul Baltodano Marquez on 15/12/21.
//

import RxSwift
import Alamofire
import AlamofireObjectMapper

final class AppServiceClient: RestApiBase {

    func getWeather(from coordinates: [Double]) -> Observable<ApiWeatherResponse> {
      print("get weather city", coordinates)
      let finalUrl = baseUrl + "weather?"
      parameters["lat"] = String(coordinates[0])
      parameters["lon"] = String(coordinates[1])
      return Observable<ApiWeatherResponse>.create({ observer -> Disposable in
        self.request = AF.request(finalUrl, parameters: self.parameters)
          .validate()
          .responseObject(completionHandler: { (response: AFDataResponse<ApiWeatherResponse>) in
          switch response.result {
          case .success(let data):
            observer.onNext(data)
            observer.onCompleted()
              print("success service ", data.toJSON())
          case .failure(let error):
            observer.onError(error)
              print("error servic", error)
          }
        })
        return Disposables.create(with: {
          self.request?.cancel()
        })
      })
    }
    
}
