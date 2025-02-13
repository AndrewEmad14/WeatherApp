//
//  HomeScreenDataModek'.swift
//  WeatherAPP
//
//  Created by Andrew Emad on 12/02/2025.
//

import Foundation

struct Weather : Decodable{
   var location : Location?
   var current : CurrentWeather?
   var forecast : ForeCastList?
    
}
struct Location : Decodable{
    var name : String?
   
}
struct CurrentWeather : Decodable{
       var temp_c : Double?
       var is_day: Int?
       var condition : Condition?
       var pressure_mb : Double?
       var humidity : Double?
       var feelslike_c : Double?
       var vis_km : Double?

}
struct ForeCastList : Decodable{
    var  forecastday : [ForeCast]?
    
}
struct ForeCast : Decodable{
    var date : String?
    var day : DayInfo?
    var hour : [HourInfo]?
    var date_epoch : Int
    
}
struct DayInfo : Decodable{
        var maxtemp_c : Double?
        var mintemp_c : Double?
        var condition : Condition?
}
struct HourInfo : Decodable{
   
                var time : String?
                var temp_c: Double?
                var condition : Condition?
              
}
struct Condition : Decodable{
    var text : String?
    var icon : String?
}
