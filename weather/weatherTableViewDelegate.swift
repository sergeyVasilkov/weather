//
//  weatherTableViewDelegate.swift
//  weather
//
//  Created by Сергей on 29/08/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import Foundation
import UIKit

final class WeatherTableViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {

    private let weatherPredictions: [String]

    init(weatherPredictions: [String]) {
        self.weatherPredictions = weatherPredictions
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherPredictions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as? WeatherTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.weatherLabel.backgroundColor = .white


        cell.layer.masksToBounds = true

        cell.weatherLabel.layer.masksToBounds = true
        cell.weatherLabel.layer.cornerRadius = 16
        cell.shadow.layer.masksToBounds = false
        cell.shadow.layer.shadowRadius = 2
        cell.shadow.layer.shadowOpacity = 0.5
        cell.shadow.layer.shadowOffset = CGSize(width: 0 , height: 2)
        cell.shadow.layer.shadowColor = UIColor.black.cgColor
        cell.shadow.layer.cornerRadius = 16

        cell.weatherLabel.text = weatherPredictions[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
