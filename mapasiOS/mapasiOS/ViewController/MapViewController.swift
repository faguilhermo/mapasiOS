//
//  MapViewController.swift
//  mapasiOS
//
//  Created by Fabrício Guilhermo on 27/03/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    lazy var locationClass = Location()
    var location = ""

    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .roundedRect)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("+", for: .normal)
        closeButton.transform = CGAffineTransform(rotationAngle: 0.785398)
        closeButton.layer.cornerRadius = 20
        closeButton.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        closeButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction(_ :)), for: .touchUpInside)

        return closeButton
    }()

    private lazy var map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.layer.cornerRadius = 20

        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        view.addSubview(closeButton)
        view.addSubview(map)
        initialLocation()
        map.delegate = locationClass

        autoLayout()
    }

    private func initialLocation() {
        Location().convertAddressToCoordinates(location) { (foundLocation) in
            let pin = Location().pinConfig(title: "Destination", location: foundLocation, color: .black, icon: UIImage(named: "person.png"))
            let region = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)
            self.map.setRegion(region, animated: true)
            self.map.addAnnotation(pin)
        }
    }

    

    @objc private func closeButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MapViewController {
    private func autoLayout() {
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true

        map.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        map.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        map.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
}
