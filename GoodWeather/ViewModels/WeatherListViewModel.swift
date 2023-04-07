//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 4.04.2023.
//

import Foundation

class WeatherListViewModel{
    private var weatherViewModels = [WeatherViewModel]()
    func addWeatherViewModel(vm:WeatherViewModel){
        weatherViewModels.append(vm)
        print(weatherViewModels.count)

    }
    func numberOfRows(_ section : Int)->Int{
        return weatherViewModels.count
    }
    func modelAt(_ index : Int)->WeatherViewModel{
        return weatherViewModels[index]
    }
    func toCelcius(){
        weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32)*5/9
            return weatherModel
            
        }
    }
    func toFahrenheit(){
        weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5)+32
            return weatherModel

            
        }
    }
    
    func updateUnit(to unit:Unit){
        switch unit{
        case .celsius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}
class WeatherViewModel{
    let weather : WeatherResponse
    var temperature:Double
    
    init(weather:WeatherResponse){
        self.weather = weather
        temperature = weather.main.temp
    }
    var city:String{
        return weather.name
    }
}
