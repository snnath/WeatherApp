//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Sohan Nath on 11/06/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string:"https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")){image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                        
                        
                    }placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment:.leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading,spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer",name: "Min Temp",value:(weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer",name: "Max Temp",value:(weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind",name: "Wind Speed",value:(weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity",name: "Humidity",value:(weather.main.humidity.roundDouble() + "%"))
                    }

                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor((Color(hue: 0.689, saturation: 0.541, brightness: 0.767)))
                .background(.white)
                .cornerRadius(20,corners: [.topLeft,.topRight])
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.689, saturation: 0.541, brightness: 0.767))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
