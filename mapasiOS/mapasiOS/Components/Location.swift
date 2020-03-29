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
}
