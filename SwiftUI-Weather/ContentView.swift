//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by John Kouris on 11/7/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(isNight: $isNight)
            
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(day: Day(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76))
                    WeatherDayView(day: Day(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88))
                    WeatherDayView(day: Day(dayOfWeek: "THU", imageName: "wind.snow", temperature: 33))
                    WeatherDayView(day: Day(dayOfWeek: "FRI", imageName: "cloud.drizzle.fill", temperature: 66))
                    WeatherDayView(day: Day(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 60))
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: Day
    
    var body: some View {
        VStack {
            Text(day.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: day.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(day.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

