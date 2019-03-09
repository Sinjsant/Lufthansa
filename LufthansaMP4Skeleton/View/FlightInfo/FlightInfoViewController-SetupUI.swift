//
//  FlightInfoViewController-SetupUI.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/9/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit


extension FlightInfoViewController {
    func setupUI() {
        planeTypeLabel = UILabel(frame: CGRect(x: 20, y: 127, width: view.frame.width, height: 50))
        planeTypeLabel.font = UIFont(name: "ProximaNova-Regular", size: 22)
        planeTypeLabel.textColor = .white
        planeTypeLabel.text = "Aircraft: \(flight!.planeType)"
        view.addSubview(planeTypeLabel)
        
        statusLabel = UILabel(frame: CGRect(x: 20, y: 155, width: view.frame.width, height: 50))
        statusLabel.font = UIFont(name: "ProximaNova-Regular", size: 22)
        statusLabel.textColor = .white
        statusLabel.text = "Status: \(flight!.timeStatus)"
        view.addSubview(statusLabel)
        
        planeIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        planeIcon.center = CGPoint(x: view.frame.width/2, y: statusLabel.frame.maxY + 55)
        planeIcon.image = UIImage(named: "plane")
        planeIcon.contentMode = .scaleAspectFill
        view.addSubview(planeIcon)
        
        startAirportLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        startAirportLabel.center = CGPoint(x: 100, y: planeIcon.center.y)
        startAirportLabel.textAlignment = .center
        startAirportLabel.font = UIFont(name: "ProximaNova-Bold", size: 40)
        startAirportLabel.text = "\(flight!.startAirport)"
        startAirportLabel.textColor = .white
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.airportSelected))
        startAirportLabel.addGestureRecognizer(tap1)
        startAirportLabel.isUserInteractionEnabled = true
        view.addSubview(startAirportLabel)
        
        endAirportLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        endAirportLabel.center = CGPoint(x: view.frame.width-100, y: planeIcon.center.y)
        endAirportLabel.textAlignment = .center
        endAirportLabel.font = UIFont(name: "ProximaNova-Bold", size: 40)
        endAirportLabel.text = "\(flight!.endAirport)"
        endAirportLabel.textColor = .white
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.airportSelected))
        endAirportLabel.addGestureRecognizer(tap2)
        endAirportLabel.isUserInteractionEnabled = true
        view.addSubview(endAirportLabel)
        
        startTimeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        startTimeLabel.center = CGPoint(x: startAirportLabel.center.x, y: startAirportLabel.center.y + 40)
        startTimeLabel.textAlignment = .center
        startTimeLabel.font = UIFont(name: "ProximaNova-Semibold", size: 22)
        startTimeLabel.textColor = .white
        startTimeLabel.text = "\(flight!.startTime)"
        view.addSubview(startTimeLabel)
        
        endTimeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        endTimeLabel.center = CGPoint(x: endAirportLabel.center.x, y: endAirportLabel.center.y + 40)
        endTimeLabel.textAlignment = .center
        endTimeLabel.font = UIFont(name: "ProximaNova-Semibold", size: 22)
        endTimeLabel.textColor = .white
        endTimeLabel.text = "\(flight!.endTime)"
        view.addSubview(endTimeLabel)
        
        startTerminalLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        startTerminalLabel.center = CGPoint(x: startTimeLabel.center.x, y: startTimeLabel.center.y + 35)
        startTerminalLabel.textAlignment = .center
        startTerminalLabel.font = UIFont(name: "ProximaNova-Regular", size: 20)
        startTerminalLabel.textColor = .white
        startTerminalLabel.text = "Terminal \(flight!.startTerminal)"
        view.addSubview(startTerminalLabel)
        
        endTerminalLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        endTerminalLabel.center = CGPoint(x: endTimeLabel.center.x, y: endTimeLabel.center.y + 35)
        endTerminalLabel.textAlignment = .center
        endTerminalLabel.font = UIFont(name: "ProximaNova-Regular", size: 20)
        endTerminalLabel.textColor = .white
        endTerminalLabel.text = "Terminal \(flight!.endTerminal)"
        view.addSubview(endTerminalLabel)
        
        startGateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        startGateLabel.center = CGPoint(x: startTerminalLabel.center.x, y: startTerminalLabel.center.y + 25)
        startGateLabel.textAlignment = .center
        startGateLabel.font = UIFont(name: "ProximaNova-Regular", size: 20)
        startGateLabel.textColor = .white
        startGateLabel.text = "Gate \(flight!.startGate)"
        view.addSubview(startGateLabel)
        
        endGateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        endGateLabel.center = CGPoint(x: endTerminalLabel.center.x, y: endTerminalLabel.center.y + 25)
        endGateLabel.textAlignment = .center
        endGateLabel.font = UIFont(name: "ProximaNova-Regular", size: 20)
        endGateLabel.textColor = .white
        endGateLabel.text = "Gate \(flight!.endGate)"
        view.addSubview(endGateLabel)
    }
}
