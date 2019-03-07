//
//  Flight.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON

class Flight {
    var fullJSON: JSON?

    var timeStatus = ""
    var startAirport = ""
    var endAirport = ""
    var startTime = ""
    var endTime = ""
    var planeType = ""
    var startTerminal = ""
    var endTerminal = ""
    var startGate = ""
    var endGate = ""
    
    
    init(data: JSON) {
        fullJSON = data
        let smallJson = data["FlightStatusResource"]["Flights"]["Flight"]
        timeStatus = smallJson["Departure"]["TimeStatus"]["Definition"].stringValue
        startAirport = smallJson["Departure"]["AirportCode"].stringValue
        endAirport = smallJson["Arrival"]["AirportCode"].stringValue
        startTime = String(smallJson["Departure"]["ActualTimeLocal"]["DateTime"].stringValue.suffix(5))
        endTime = String(smallJson["Arrival"]["ActualTimeLocal"]["DateTime"].stringValue.suffix(5))
        planeType = smallJson["Equipment"]["AircraftCode"].stringValue
        startTerminal = smallJson["Departure"]["Terminal"]["Name"].stringValue
        endTerminal = smallJson["Arrival"]["Terminal"]["Name"].stringValue
        startGate = smallJson["Departure"]["Terminal"]["Gate"].stringValue
        endGate = smallJson["Arrival"]["Terminal"]["Gate"].stringValue
 
    }
    
    //FIXME
}
