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
    /// Convert user's input in CLPlacemark coordinates.
    /// - Parameter address: user input address.
    /// - Parameter local: the coordinate found.
    /// - Parameter local: the found coordinate escape to other function.
    public func convertAddressToCoordinates(_ address: String, local: @escaping(_ local: CLPlacemark) -> Void) {
        let converter = CLGeocoder()
        converter.geocodeAddressString(address) { (localizationList, error) in
            guard let localization = localizationList?.first else { return }
            local(localization)
        }
    }

    /// A pin generator, to easily create a pin.
    /// - Parameter title: the pin title.
    /// - Parameter location: the pin coordinates.
    /// - Parameter color: the pin color.
    /// - Parameter icon: the pin icon.
    /// - Returns: the pin object created.
    public func pinConfig(title: String, location: CLPlacemark, color: UIColor?, icon: UIImage?) -> Pin {
        let pin = Pin(coordinate: location.location!.coordinate)
        pin.title = title
        pin.color = color
        pin.icon = icon

        return pin
    }
}

// MARK: - Extensions
extension Location: MKMapViewDelegate {
    // change the real pin appearance
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Pin {
            let annotationView = annotation as! Pin
            guard let title = annotationView.title else { return nil }
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: title) as? MKMarkerAnnotationView
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: title)

            pinView?.annotation = annotationView
            pinView?.glyphImage = annotationView.icon
            pinView?.markerTintColor = annotationView.color

            return pinView
        }
        return nil
    }
}
