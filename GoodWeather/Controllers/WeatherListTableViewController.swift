//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Enes Talha Yılmaz on 2.04.2023.
//

import Foundation
import UIKit

class WeatherListTableViewController : UITableViewController,AddWeatherDelegate,SettingsDelegate {
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection : Unit!
    
    func addWeatherDidSave(vm:WeatherViewModel){
        
        weatherListViewModel.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let userDefaults=UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String{
            self.lastUnitSelection = Unit(rawValue:value)!
            
        }
       
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController"{
            prepareSegueForAddWeatherCityViewController(segue:segue)
        }
        if segue.identifier == "SettingsTableViewController"{
            prepareSegueForSettingsViewController(segue: segue)
        }
    }
    func prepareSegueForAddWeatherCityViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NavigationController not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else{
            fatalError("AddWeatherCityViewController not found")
        }
        addWeatherCityVC.delegate=self
    }
    func prepareSegueForSettingsViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NavigationController not found")
        }
        guard let addSettingVC = nav.viewControllers.first as? SettingsTableViewController else{
            fatalError("SettingsTableViewController not found")
        }
        addSettingVC.delegate=self
    }
}
extension WeatherListTableViewController{
    func settingsDone(vm:SettingsViewModel){
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue{
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue:vm.selectedUnit.rawValue)!
        }
            
    }
}
