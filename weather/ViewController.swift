import UIKit

class ViewController: UIViewController {

    private let headerView: HeaderView = {
        let header = HeaderView ()
        header.frame = CGRect(x: 0, y: 0, width: 0, height: 230)
        header.translatesAutoresizingMaskIntoConstraints = true
        return header
    }()

    @IBOutlet var gradient: GradientView!
    @IBOutlet weak var weatherTableView: UITableView!
    var weatherPredictions: [String] = ["Четверг", "Пятница"]
    var weatherTemperatures: [String] = ["12º", "15º"]
    let cellSpacingHeight: CGFloat = 10

    private lazy var tableViewModel =
        WeatherTableViewModel(weatherPredictions: weatherPredictions, weatherTemperatures: weatherTemperatures)

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.gradientLayer.frame = self.view.bounds
    }

//    func headerSetup() {
//        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 230)
//        headerView.translatesAutoresizingMaskIntoConstraints = true
//    }

    func weatherTableSetup() {
        weatherTableView.delegate = tableViewModel
        weatherTableView.dataSource = tableViewModel
        weatherTableView.tableHeaderView = headerView
    }

    func gradientSetup() {
        gradient.gradientLayer.colors = [gradient.darkBlue, gradient.lightBlue]
        gradient.gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.view.layer.insertSublayer(gradient.gradientLayer, at: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        weatherTableSetup()
//        headerSetup()
        gradientSetup()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
