//
//  HomeScreenViewModel.swift
//  WeatherAPP
//
//  Created by Andrew Emad on 12/02/2025.
//

import Foundation

class HomeScreenViewModel : ObservableObject{
    @Published var apiJsonResult = Weather()
    init(){
       
            self.fetchDataFromJson()
        
        
    }
    func fetchDataFromJson(){
        NetworkManager.sharedInstance.fetchDataFromJSONWeatherForecast(urlString: "https://api.weatherapi.com/v1/forecast.json?key=85c745bf8b7749a6860130519251202&q=Cairo&days=3&aqi=no&alerts=no") { res, error in
            guard let tempRes = res else{
                print("Watashiwa nil desu")
                return}
            DispatchQueue.main.async{
                self.apiJsonResult = tempRes
            }
        }
    }
}
