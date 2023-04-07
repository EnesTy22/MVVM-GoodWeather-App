//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 3.04.2023.
//

import Foundation
import UIKit

class WeatherCell : UITableViewCell{
    
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var cityNameLbl: UILabel!
    
    func configure(_ vm:WeatherViewModel){
        self.cityNameLbl.text = vm.city
        self.temperatureLbl.text = String(vm.temperature.formatAsDegree())
    }
}
