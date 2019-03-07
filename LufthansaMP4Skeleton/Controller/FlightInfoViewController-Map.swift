//
//  FlightInfoViewController-Map.swift
//  LufthansaMP4Skeleton
//
//  Created by Sinjon Santos on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import MapKit


extension FlightInfoViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Airport else {
            return nil
        }
        let identifier = "marker"
        let view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            print("Created a new view")
            print(annotation.title)
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRender = MKPolylineRenderer(overlay: overlay)
        polylineRender.strokeColor = .red
        polylineRender.lineWidth = 5
        return polylineRender
    }
    
    
}
