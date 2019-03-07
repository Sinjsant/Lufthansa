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
        timeStatus = data["Departure"]["TimeStatus"]["Definition"].stringValue
        startAirport = data["Departure"]["AirportCode"].stringValue
        endAirport = data["Arrival"]["AirportCode"].stringValue
        startTime = String(data["Departure"]["ActualTimeLocal"]["DateTime"].stringValue.suffix(5))
        endTime = String(data["Arrival"]["ActualTimeLocal"]["DateTime"].stringValue.suffix(5))
        planeType = data["Equipment"]["AircraftCode"].stringValue
        startTerminal = data["Departure"]["Terminal"]["Name"].stringValue
        endTerminal = data["Arrival"]["Terminal"]["Name"].stringValue
        startGate = data["Departure"]["Terminal"]["Gate"].stringValue
        endGate = data["Arrival"]["Terminal"]["Gate"].stringValue
 
    }
    
    //FIXME
}
