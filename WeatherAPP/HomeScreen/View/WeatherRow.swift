//
//  WeatherRow.swift
//  WeatherAPP
//
//  Created by Andrew Emad on 12/02/2025.
//

import SwiftUI

struct WeatherRow: View {
    @State var foreCast:ForeCast
    var body: some View {
        HStack{
            Text("Today")
            Image("1")
                .resizable()
                .frame(width: 50 ,height: 50)
                .padding(.leading,10)
                .padding(.trailing,40)
                .scaledToFit()
            let tempLow = "\((foreCast.day?.maxtemp_c)!)°"
            let tempHigh = "\((foreCast.day?.mintemp_c)!)°"
            
            Text(tempLow)
            Text(tempHigh)
        }
    }
}

#Preview {
    WeatherRow(foreCast: ForeCast(date: "12-10-2024", day: DayInfo(maxtemp_c: 15.0,mintemp_c: 16.0,condition: Condition(text: "hi", icon: "1")), hour: [HourInfo(time: "", temp_c: 10.0, condition: Condition(text: "hi", icon: "1"))], date_epoch: 1020) )
}
