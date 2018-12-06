//
//  ForecastTVC.swift
//  Weather
//
//  Created by Shuran Zhang on 8/12/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class WeatherTableController: UITableViewController {
    
    var forecastHelper = StudentCenterHelper()
    var forecasts = [StudentCenter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("str_weather", comment: "")
        
        if Constants.apiKey.isEmpty {
            let alert = UIAlertController(title: "Error", message: "No api key found. Can't retrieve data", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        forecastHelper.fetchStudentCenter() { result in
            switch result {
            case let .Success(forecasts):
                print("Succeed")
                self.forecasts = forecasts
                print(self.forecasts.description)
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
                
            case .Failure:
                print("Failed")
                break
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("func\(forecasts.count)")
        return forecasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell else {
            fatalError("Expected ForecastCell")
        }
        
        let forecast = forecasts[indexPath.row]
        cell.dayLabel?.text = dayFromSeconds(seconds: forecast.time!, timeZoneString: forecast.timezone!)
        cell.summaryLabel?.text = forecast.summary
        if let iconImage = UIImage(named: forecast.icon!) {
            cell.weatherIcon?.image = iconImage
        }
        
        return cell
    }
    
}
