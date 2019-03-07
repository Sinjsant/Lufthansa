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
    
    func initUI(){
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = self.view.bounds
        gradientBackground.colors = [UIColor(red:0.19, green:0.16, blue:0.42, alpha:1.0).cgColor, UIColor(red:0.52, green:0.18, blue:0.57, alpha:1.0).cgColor]
        gradientBackground.locations = [0.3, 1.0]
        view.layer.insertSublayer(gradientBackground, at: 0)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        titleLabel.center = CGPoint(x: view.frame.width/2, y: 150)
        titleLabel.textAlignment = .center
        titleLabel.text = "Find your flight"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "ProximaNova-Bold", size: 46)
        view.addSubview(titleLabel)
        
        nameLabel = UILabel(frame: CGRect(x: 50, y: titleLabel.frame.maxY + 80, width: view.frame.width, height: 50))
        nameLabel.text = "Enter flight number:"
        nameLabel.font = UIFont(name: "ProximaNova-Semibold", size: 24)
        nameLabel.textColor = .white
        view.addSubview(nameLabel)
        
        
        nameField = TextField(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        nameField.center = CGPoint(x: view.frame.width/2, y: nameLabel.frame.maxY + 50)
        nameField.placeholder = "Flight #"
        nameField.placeholderNormalColor = .white
        nameField.textColor = .white
        nameField.placeholderVerticalOffset = 10
        nameField.placeholderActiveColor = .white
        nameField.dividerActiveColor = .white
        nameField.font = UIFont(name: "ProximaNova-Semibold", size: 22)
        nameField.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        nameField.autocorrectionType = UITextAutocorrectionType.no
        view.addSubview(nameField)
        
        
        dateLabel = UILabel(frame: CGRect(x: 50, y: nameField.frame.maxY + 55, width: view.frame.width, height: 50))
        dateLabel.text = "Select date:"
        dateLabel.font = UIFont(name: "ProximaNova-Semibold", size: 24)
        dateLabel.textColor = .white
        view.addSubview(dateLabel)
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        datePicker.center = CGPoint(x: view.frame.width/2, y: dateLabel.frame.maxY + 60)
        datePicker.setValuesForKeys(["textColor": UIColor.white])
        datePicker.datePickerMode = .date
        view.addSubview(datePicker)
        
        submitButton = Button(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        submitButton.center = CGPoint(x: view.frame.width/2, y: datePicker.frame.maxY + 100)
        submitButton.setTitle("Continue", for: .normal)
        submitButton.titleLabel!.font = UIFont(name: "ProximaNova-Semibold", size: 28)
        submitButton.backgroundColor = UIColor(red:0.19, green:0.16, blue:0.42, alpha:1.0)
        submitButton.layer.cornerRadius = submitButton.frame.height/2
        submitButton.pulseColor = .white
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        view.addSubview(submitButton)
        

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

