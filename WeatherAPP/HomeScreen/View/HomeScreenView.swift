//
//  HomeScreenView.swift
//  WeatherAPP
//
//  Created by Andrew Emad on 12/02/2025.
//

import SwiftUI

struct HomeScreenView: View {
    @State var isDay:Bool = false
    @StateObject var viewModel = HomeScreenViewModel()
 
    var body: some View {
        ZStack {
           
          
            Image("CustomImage")
            VStack{
                if viewModel.apiJsonResult.location?.name != nil{
                    Text((viewModel.apiJsonResult.location?.name)!)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color("Color"))
                }//end of if  Loction
                if viewModel.apiJsonResult.current?.temp_c != nil{
                    let tempStr = "\((viewModel.apiJsonResult.current?.temp_c)!)°"
                    Text(tempStr)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color("Color"))
                }//end of if   degree
                if viewModel.apiJsonResult.current?.condition?.text != nil{
                    Text((viewModel.apiJsonResult.current?.condition?.text)!)
                        .font(.largeTitle)
                        .foregroundStyle(Color("Color"))
                }//end of if  Condition Text
                HStack{
                    if viewModel.apiJsonResult.forecast?.forecastday?[0].day?.maxtemp_c != nil{
                        let tempStr = "H:\((viewModel.apiJsonResult.forecast?.forecastday?[0].day?.maxtemp_c)!)°"
                        Text(tempStr)
                            .font(.title)
                            .foregroundStyle(Color("Color"))
                    }//end of if High
                    if viewModel.apiJsonResult.forecast?.forecastday?[0].day?.mintemp_c != nil{
                        let tempStr = "L:\((viewModel.apiJsonResult.forecast?.forecastday?[0].day?.mintemp_c)!)°"
                        Text(tempStr)
                            .font(.title)
                            .foregroundStyle(Color("Color"))
                    }//end of if Low
                    
                }//end of HStack
                if viewModel.apiJsonResult.current?.condition?.icon != nil {
                    AsyncImage(url: URL(string:"https:\((viewModel.apiJsonResult.current?.condition?.icon)!)") ) {
                        phase in
                        switch phase {
                        case .empty:
                               ProgressView()

                        case .success(let image):
                                image
                                .padding(.bottom,60)
                        case .failure:
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.gray)
                                    .containerRelativeFrame(
                                        .horizontal, alignment: .center)
                            
                            }
                        @unknown default:
                            EmptyView()
                        }
                    }//end of Async condition icon
                    
                }//end of if condition icon
                Text("3-Day FORECAST")
                    .font(.subheadline)
                    .foregroundStyle(Color("Color"))
                    .offset(x:-100)
                Divider()
                if viewModel.apiJsonResult.forecast?.forecastday != nil{
                    List{
                        ForEach((viewModel.apiJsonResult.forecast?.forecastday)!,id:\.date_epoch){ Day in
                            HStack{
                                Text("Today")
                                Image("1")
                                    .resizable()
                                    .frame(width: 50 ,height: 50)
                                    .padding(.leading,10)
                                    .padding(.trailing,40)
                                    .scaledToFit()
                                let tempLow = "\((Day.day?.maxtemp_c)!)°"
                                let tempHigh = "\((Day.day?.mintemp_c)!)°"
                                
                                Text(tempLow)
                                Text(tempHigh)
                            }  .listRowBackground(Color.clear)
                        }
                    }.frame(width: 350,height:300)
                        .scrollContentBackground(.hidden)
                      
                }
                  
                
            }//end of Vstack
           
          
               
        }.preferredColorScheme(viewModel.apiJsonResult.current?.is_day != nil ? viewModel.apiJsonResult.current?.is_day == 1 ? .light : .dark : .light) //end of ZStack
        
        
    }
}

#Preview {
    HomeScreenView()
}
