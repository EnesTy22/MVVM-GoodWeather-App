//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 5.04.2023.
//

import Foundation
enum Unit : String,CaseIterable
{
    case celsius = "metric"
    case fahrenheit = "imperial"
}
extension Unit{
    var displayName:String{
        get{
            switch(self){
            case .celsius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}
class SettingsViewModel{
    let units = Unit.allCases
    var selectedUnit:Unit{
        get{
            let userDefaults = UserDefaults.standard
            var unitValue = Unit.celsius.rawValue
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            print(unitValue)
            
            return Unit(rawValue:unitValue)!
            
        }
        set{
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue,forKey: "unit")
        }
    }
}
