//
//  AirportInfoViewController-Table.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/7/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension AirportInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func height(for index: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! AirportInfoTableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        let size = CGSize(width: tableView.frame.width, height: height(for: indexPath))
        cell.awakeFromNib()
        cell.initCellFrom(size: size)
        cell.flightName = arrivalAirports[indexPath.row].startAirport
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrivalAirports.count
    }
    
    
    
}
