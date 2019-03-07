//
//  AirportInfoTableViewCell.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/7/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class AirportInfoTableViewCell: UITableViewCell {
    
    
    var flightName = "Placeholder text"
    var nameLabel: UILabel!
    var flight: Flight? 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func initCellFrom(size: CGSize) {
        nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: size.width, height: 20))
        nameLabel.textColor = .black
        nameLabel.text = flightName
        contentView.addSubview(nameLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
