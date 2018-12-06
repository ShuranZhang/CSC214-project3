//
//  StudentCenterCell.swift
//  Weather
//
//  Created by Shuran Zhang on 8/12/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func layoutSubviews() {
        
        weatherIcon.layer.cornerRadius = weatherIcon.frame.height / 5
        weatherIcon.layer.masksToBounds = true
    }
}
