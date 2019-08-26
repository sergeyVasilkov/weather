//
//  ViewController.swift
//  wWather
//
//  Created by Сергей on 20/08/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weatherTableView: UITableView!
    var weatherPredictions:[String]=["10", "12"]
    let cellSpacingHeight: CGFloat = 5
    
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
        cell.layer.cornerRadius = 15
       cell.weatherLabel.text = weatherPredictions[indexPath.row]
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 84
    }
    
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherTableView.tableFooterView = UIView()
    }
}
