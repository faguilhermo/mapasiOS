//
//  Pino.swift
//  mapasiOS
//
//  Created by Fabrício Guilhermo on 27/03/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit
import MapKit

class Pino: NSObject, MKAnnotation {

    var coordinate: CLLocationCoordinate2D
    var title: String?
    var icon: UIImage?
    var color: UIColor?

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
