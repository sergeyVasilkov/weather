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

class ViewController: UIViewController {

   private let headerView = HeaderView()
    @IBOutlet weak var header: UIView!
    @IBOutlet var gradient: GradientView!
    @IBOutlet weak var weatherTableView: UITableView!
    var weatherPredictions:[String] = ["  Четверг", "  Пятница"]
    var weatherTemperatures:[String] = ["12º", "15º"]
    let cellSpacingHeight: CGFloat = 10

    private lazy var tableViewModel = WeatherTableViewModel(weatherPredictions: weatherPredictions , weatherTemperatures: weatherTemperatures)

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.gradientLayer.frame = self.view.bounds
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        weatherTableView.delegate = tableViewModel
        weatherTableView.dataSource = tableViewModel 
        // Do any additional setup after loading the view.
//        headerView.location = "Omsk"
//        headerView.condition = "Rainy"
//        headerView.temperature = "14"

        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 230)
        headerView.translatesAutoresizingMaskIntoConstraints = true
        weatherTableView.tableHeaderView = headerView
        gradient.gradientLayer.colors = [gradient.darkBlue ,gradient.lightBlue]
        gradient.gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.view.layer.insertSublayer(gradient.gradientLayer, at:0)

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
