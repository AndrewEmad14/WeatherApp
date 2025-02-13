//
//  NetworkManager.swift
//  WeatherAPP
//
//  Created by Andrew Emad on 12/02/2025.
//

import Foundation


class NetworkManager{
   static let sharedInstance = NetworkManager()
    private init(){}
    func fetchDataFromJSONWeatherForecast(urlString : String ,completionHandler : @escaping (Weather?,Error?)->Void){
     
      let url = URL(string: urlString)
      guard let newUrl = url else{return}
      let request = URLRequest(url: newUrl)
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: request) { data, response, error in
          guard let data = data else{return}
          do{
              let result = try JSONDecoder().decode(Weather.self, from: data)
              completionHandler(result,error)
          }catch{
              completionHandler(nil,error)
          }
          
      }
      task.resume()
    }
  
}

