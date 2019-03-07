//
//  Airport.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class Airport: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(location: CLLocationCoordinate2D, name: String){
        coordinate = location
        title = name
    }
    

}
