//
//  FlightInfoViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class FlightInfoViewController: UIViewController {
    
    var flight: Flight?
    var flightNum = ""
    var flightTime = ""
    var favoriteButton: UIBarButtonItem!
    var planeIcon: UIImageView!
    var statusLabel: UILabel!
    var startAirportLabel: UILabel!
    var endAirportLabel: UILabel!
    var startTimeLabel: UILabel!
    var endTimeLabel: UILabel!
    var startTerminalLabel: UILabel!
    var endTerminalLabel: UILabel!
    var startGateLabel: UILabel!
    var endGateLabel: UILabel!
    var planeTypeLabel: UILabel!
    
    var mapView: MKMapView!
    
    var airportArray: [Airport] = [] {
        didSet {
            if airportArray.count == 2 {
                let coords = self.airportArray.map {$0.coordinate}
                print(coords)
                let line = MKPolyline(coordinates: coords, count: 2)
                self.mapView.addOverlay(line)
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.title = "Flight \(flightNum)"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.tintColor = .white
        
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
        view.addSubview(startAirportLabel)
        
        endAirportLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        endAirportLabel.center = CGPoint(x: view.frame.width-100, y: planeIcon.center.y)
        endAirportLabel.textAlignment = .center
        endAirportLabel.font = UIFont(name: "ProximaNova-Bold", size: 40)
        endAirportLabel.text = "\(flight!.endAirport)"
        endAirportLabel.textColor = .white
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
        
        mapView = MKMapView(frame: CGRect(x: 0, y: view.frame.height/2, width: view.frame.width, height: view.frame.height/2))
        mapView.delegate = self
        view.addSubview(mapView)
        addAirports()
        centerMap()
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = self.view.bounds
        gradientBackground.colors = [UIColor(red:0.19, green:0.16, blue:0.42, alpha:1.0).cgColor, UIColor(red:0.52, green:0.18, blue:0.57, alpha:1.0).cgColor]
        gradientBackground.locations = [0.3, 1.0]
        view.layer.insertSublayer(gradientBackground, at: 0)
        
        let favoritesArray = UserDefaults.standard.array(forKey: "favorites") as! [String]
        if (favoritesArray.contains("\(self.flightNum) \(self.flightTime)")) {
            favoriteButton = UIBarButtonItem(image: UIImage(named: "favorited"), style: .plain, target: self, action: #selector(favorite))
        } else {
            favoriteButton = UIBarButtonItem(image: UIImage(named: "unfavorited"), style: .plain, target: self, action: #selector(favorite))
        }
        self.navigationItem.rightBarButtonItem = favoriteButton
        
        
    
    }
    
    @objc func favorite() {
        var favoritesArray = UserDefaults.standard.array(forKey: "favorites") as! [String]
        if (favoriteButton.image == UIImage(named: "unfavorited")) {
            favoritesArray.append("\(self.flightNum) \(self.flightTime)")
            favoriteButton = UIBarButtonItem(image: UIImage(named: "favorited"), style: .plain, target: self, action: #selector(favorite))
        } else {
            favoritesArray = favoritesArray.filter{$0 != "\(self.flightNum) \(self.flightTime)"}
            favoriteButton = UIBarButtonItem(image: UIImage(named: "unfavorited"), style: .plain, target: self, action: #selector(favorite))
        }
        favoriteButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = favoriteButton
        
        UserDefaults.standard.set(favoritesArray, forKey: "favorites")
    }
    
    func addAirports() {
        LufthansaAPIClient.getAirportLocation(name: flight!.startAirport) { airport in
            self.mapView.addAnnotation(airport)
            print(airport.title)
            self.airportArray.append(airport)
        }
        
        LufthansaAPIClient.getAirportLocation(name: flight!.endAirport) { airport in
            self.mapView.addAnnotation(airport)
            print(airport.title)
            self.airportArray.append(airport)
        }
    }
    
    func centerMap() {
        var location = CLLocationCoordinate2D(latitude: 51.1657, longitude: 10.4515)
        var region = MKCoordinateRegion(center: location, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        self.mapView.setRegion(region, animated : true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
