//
//  Pin.swift
//  mapasiOS
//
//  Created by Fabrício Guilhermo on 29/03/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit
import MapKit

class Pin: NSObject, MKAnnotation {
    var title: String?
    var icon: UIImage?
    var color: UIColor?
    var coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
