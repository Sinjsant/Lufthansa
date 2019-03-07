//
//  LufthansaAPIClient.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MapKit

class LufthansaAPIClient {
    static let clientSecret = "akgMs8w8SE"
    static let clientID = "cxxru3yuf5t3y7rj82npqrqx"
    
    static var authToken: String?
    
    static func getAuthToken(completion: @escaping () -> ()){
        
        let requestURL = "https://api.lufthansa.com/v1/oauth/token"
        let parameters = ["client_id": "\(clientID)", "client_secret": "\(clientSecret)", "grant_type": "client_credentials"]
        
        
        Alamofire.request(requestURL, method: .post , parameters: parameters, encoding: URLEncoding()).responseJSON { response in
         let json = JSON(response.result.value)
         self.authToken = json["access_token"].stringValue
         
         print("Auth token: " + self.authToken!)
         print("This key expires in " + json["expires_in"].stringValue + " seconds\n")
         
         completion()
         }
    }
    
    //This function will get the status for a flight. FlightNum format "LHXXX" Date format "YYYY-MM-DD"
    static func getFlightStatus(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(flightNum)/\(date)"
        let headers: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
        
        

        
        Alamofire.request(requestURL, headers: headers).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            
            let json = JSON(response.result.value)
            let flight = Flight(data: json)
            
            completion(flight)
         }
    }
    
    static func getAirportLocation(name: String, completion: @escaping (Airport) -> ()) {
        let requestURL = "https://api.lufthansa.com/v1/references/airports/\(name)?limit=1&offset=0&LHoperated=0"
        let headers: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
        
        Alamofire.request(requestURL, headers: headers).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            let latitude = json["AirportResource"]["Airports"]["Airport"]["Position"]["Coordinate"]["Latitude"].doubleValue
            let longitude = json["AirportResource"]["Airports"]["Airport"]["Position"]["Coordinate"]["Longitude"].doubleValue
            let airport = Airport(location: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), name: name)
            
            completion(airport)
        }
        
    }
}
