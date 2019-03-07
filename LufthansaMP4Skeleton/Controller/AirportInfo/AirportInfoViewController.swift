//
//  AirportInfoViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/7/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class AirportInfoViewController: UIViewController {
    
    var airportName = ""
    var airport: Airport?
    var mapView: MKMapView!
    var tableView: UITableView!
    var date: String?
    var arrivalAirports: [Flight] = [] {
        didSet {
            self.tableView.reloadData()
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 24)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ProximaNova-Semibold", size: 40)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.title = "\(airportName) Information"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.tintColor = .white
        
        mapView = MKMapView(frame: CGRect(x: 0, y: 150, width: view.frame.width, height: view.frame.height/3))
        mapView.delegate = self
        view.addSubview(mapView)
        addAirport()
        
        tableView = UITableView(frame: CGRect(x: 0, y: mapView.frame.maxY, width: view.frame.width, height: view.frame.height-mapView.frame.maxY - 50))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AirportInfoTableViewCell.self, forCellReuseIdentifier: "mainCell")
        view.addSubview(tableView)
        
        loadArrivals()

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
    }
    
    func addAirport() {
        LufthansaAPIClient.getAirportLocation(name: airportName) { airport in
            self.mapView.addAnnotation(airport)
            let location = airport.coordinate
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
            self.mapView.setRegion(region, animated : true)
        }
    }
    
    func loadArrivals() {
        LufthansaAPIClient.getArrivalFlights(from: airportName, date: "2019-03-07") {airportList in
            self.arrivalAirports = airportList
    
        }
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
