//
//  ViewController.swift
//  wWather
//
//  Created by Сергей on 20/08/2019.
//  Copyright © 2019 Effective. All rights reserved.
//
//TODO: поменять размеры в соответствии с дизайном на figma
// добавить Header в TableView в качестве параметра tableHeaderView
// header сделать кастомно ( как RatingControl )
// add GradientView ( вынести градиент в отдельную view )
// status bar -> white
// check layer



import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var header: UIView!
    @IBOutlet var gradient: GradientView!
    @IBOutlet weak var weatherTableView: UITableView!
    var weatherPredictions:[String] = ["  Четверг", "  Пятница"]
    let cellSpacingHeight: CGFloat = 10

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
        return 90    }

    //   func tableView(_ tableView: UITableView, heightForHeaderInSection indexPath: IndexPath) -> CGFloat {
    //       return 50
    //   }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // weatherTableView.tableHeaderView = header

        gradient.gradientLayer.frame = self.view.bounds
        gradient.gradientLayer.colors = [gradient.firstColor,gradient.secondColor]
        gradient.gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.view.layer.insertSublayer(gradient.gradientLayer, at:0)

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
