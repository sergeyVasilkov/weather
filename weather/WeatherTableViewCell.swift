//
//  WeatherTableViewCell.swift
//  weather
//
//  Created by Сергей on 26/08/2019.
//  Copyright © 2019 Effective. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
