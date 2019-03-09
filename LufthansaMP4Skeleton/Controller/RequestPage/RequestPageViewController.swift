//
//  ViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import Material

class RequestPageViewController: UIViewController {

    var image: UIImageView!
    var label: UILabel!
    var button: UIButton!
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var nameField: TextField!
    var dateLabel: UILabel!
    var datePicker: UIDatePicker!
    var submitButton: Button!
    var flight: Flight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        UserDefaults.standard.set([Int](), forKey: "favorites")
    }
    
    

   
    
    @objc func submit(_ sender: Any) {
        //Gets new auth token and then gets flight status once that is successful
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let dateText = formatter.string(from: self.datePicker.date)
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getFlightStatus(flightNum: "\(self.nameField.text!)", date: "\(dateText)") { flt in
                //self.label.text = flt.timeStatus
                print(flt.fullJSON)
                self.flight = flt
                self.performSegue(withIdentifier: "toFlightInfo", sender: self)
            }
        }
        submitButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFlightInfo" {
            let resultVC = segue.destination as! FlightInfoViewController
            resultVC.flight = self.flight
            resultVC.flightNum = self.nameField.text ?? ""
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY-MM-dd"
            let dateText = formatter.string(from: self.datePicker.date)
            resultVC.flightTime = dateText
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        submitButton.isEnabled = true
    }
    
    
}

