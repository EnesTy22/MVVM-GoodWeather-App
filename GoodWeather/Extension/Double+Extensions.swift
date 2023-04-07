//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 4.04.2023.
//

import Foundation

extension Double{
    func formatAsDegree() -> String{
        return String(format: "%.0f°",self)
    }
}
