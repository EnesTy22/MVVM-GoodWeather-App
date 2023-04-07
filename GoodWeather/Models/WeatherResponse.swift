//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 3.04.2023.
//

import Foundation
struct WeatherResponse :Decodable{
    let name:String
    let main :Weather
    
}
struct Weather :Decodable{
    let temp :Double
    let feels_like: Double
    let humidity : Int
}
