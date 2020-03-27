//
//  Location.swift
//  mapasiOS
//
//  Created by Fabrício Guilhermo on 27/03/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit
import MapKit

final class Location: NSObject {
    public func convertAddressToCoordinates(_ address: String, local: @escaping(_ local: CLPlacemark) -> Void) {
        let converter = CLGeocoder()
        converter.geocodeAddressString(address) { (localizationList, error) in
            guard let localization = localizationList?.first else { return }
            local(localization)
        }
    }

    public func pin(_ title: String, location: CLPlacemark, color: UIColor?, icon: UIImage?) -> Pino? {
        guard let location = location.location else { return nil }
        let pin = Pino(coordinate: location.coordinate)
        pin.title = title

        return pin
    }
}

extension Location: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Pino {
            let annotation = annotation as! Pino
            guard let title = annotation.title else { return nil }
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: title) as? MKMarkerAnnotationView
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotation.title)
            pinView?.annotation = annotation
            pinView?.glyphImage = annotation.icon
            pinView?.markerTintColor = annotation.color

            return pinView
        }
        
        return nil
    }
}
