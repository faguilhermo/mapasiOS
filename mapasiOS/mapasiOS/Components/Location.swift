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

    public func pinConfig(title: String, location: CLPlacemark, color: UIColor?, icon: UIImage?) -> Pin {
        let pin = Pin(coordinate: location.location!.coordinate)
        pin.title = title
        pin.color = color
        pin.icon = icon

        return pin
    }
}

extension Location: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Pin {
            let annotationView = annotation as! Pin
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationView.title!) as? MKMarkerAnnotationView
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationView.title!)

            pinView?.annotation = annotationView
            pinView?.glyphImage = annotationView.icon
            pinView?.markerTintColor = annotationView.color

            return pinView
        }
        return nil
    }
}
