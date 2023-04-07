//
//  Constants.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 3.04.2023.
//

import Foundation

struct Constants{
    struct Urls{
        static func urlForWeatherByCity(city:String)->URL{
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=eb597480784122c68c0d3d697c79bb8d&units=\(unit)")!
        }
    }
}
