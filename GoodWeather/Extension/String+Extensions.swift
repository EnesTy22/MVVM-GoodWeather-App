//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 4.04.2023.
//

import Foundation

extension String{
    func escaped()->String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
