//
//  NumericExtensions.swift
//  weather
//
//  Created by Сергей on 22/09/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import Foundation

extension Int {
    func celsius() -> String {
        return "\(self)º"
    }

    func fahrenheits() -> String {
        return "\(self)F"
    }
}

extension Double {
    func celsius() -> String {
        return Int(self).celsius()
    }

    func fahrenheit() -> String {
        return Int(self).fahrenheits()
    }
}
