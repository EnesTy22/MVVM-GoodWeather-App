//
//  AddWeatherCıtyVıewController.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 2.04.2023.
//

import Foundation
import UIKit
protocol AddWeatherDelegate{
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController : UIViewController{

    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    var delegate : AddWeatherDelegate?
    @IBAction func  SaveCityButtonPressed(){
        if let city = cityNameTextField.text{
            addWeatherVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated:true,completion: nil)
            }
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
}
