//
//  Header.swift
//  weather
//
//  Created by Сергей on 28/08/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import UIKit

final class HeaderView: UIView {

    var location: String? {
        get {
            return locationLabel.text
        }
        set {
            locationLabel.text = newValue
        }
    }

    var condition: String? {
        get {
            return conditionsLabel.text
        }
        set {
            conditionsLabel.text = newValue
        }
    }

    var temperature: String? {
        get {
            return temperatureLabel.text
        }
        set {
            temperatureLabel.text = newValue
        }
    }

    private let locationLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "SF Pro Text", size: 24.0)
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()

    private let conditionsLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let temperatureLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("required init?(coder aDecoder: NSCoder) not implemented")
    }

    private func setup() {
        addSubview(locationLabel)
        addSubview(conditionsLabel)
        addSubview(temperatureLabel)

        // add constraints
        self.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: topAnchor, constant: 44).isActive = true

        let margins = layoutMarginsGuide
        locationLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor ).isActive = true
        locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 36).isActive = true
        locationLabel.textAlignment = .center
        locationLabel.font = UIFont(name: "SF Pro Text", size: 24.0)
        locationLabel.text = "Омск"

        conditionsLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        conditionsLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        conditionsLabel.centerXAnchor.constraint(equalTo: centerXAnchor ).isActive = true
        conditionsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 73).isActive = true
        conditionsLabel.font = UIFont(name: "SF Pro Text", size: 18.0)
        conditionsLabel.textColor = .white
        conditionsLabel.textAlignment = .center
        conditionsLabel.text = "Переменная облачность"

//        temperatureLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
//        temperatureLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
//        temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor ).isActive = true
//        temperatureLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 106).isActive = true

        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor ),
            temperatureLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 106)])

        temperatureLabel.font = UIFont(name: "SF Pro Text", size: 48.0)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.text = "14º"
    }
}
