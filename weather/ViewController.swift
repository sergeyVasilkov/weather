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
    var weatherTemperatures: [String] = [12.celsius(), 15.celsius()]
    let weather = WeatherGetter()
    var weatherInfoStruct :WeatherStruct? = nil
    let cellSpacingHeight: CGFloat = 10
    let weatherLoadingQueue = DispatchQueue.global(qos: .utility)

    private lazy var tableViewModel =
        WeatherTableViewModel(weatherPredictions: weatherPredictions, weatherTemperatures: weatherTemperatures)

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.gradientLayer.frame = self.view.bounds
    }

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

        subscribe()

        weatherTableSetup()

        //updateWeather()

        self.reloadInputViews()
        self.gradientSetup()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func updateWeather() {
        print("::updateWeather()")

        weather.getWeather(city: "Omsk") { [weak self] weatherStruct in
            guard let strongSelf = self else {
                return
            }

            UIView.transition(with: strongSelf.headerView, duration: 0.6, options: .transitionCrossDissolve, animations: {
                strongSelf.headerView.temperature =  weatherStruct.main.temp.fahrenheit()
            }, completion: nil)
        }
    }

    func subscribe() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    @objc func appDidBecomeActive(_ payload: Notification) {
        updateWeather()
    }
}
