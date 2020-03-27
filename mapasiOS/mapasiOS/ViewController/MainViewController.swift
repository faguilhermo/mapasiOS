//
//  MainViewController.swift
//  mapasiOS
//
//  Created by Fabrício Guilhermo on 27/03/20.
//  Copyright © 2020 Fabrício Guilhermo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var destinationTextField: UITextField = {
        let destinationTextField = UITextField(frame: .zero)
        destinationTextField.translatesAutoresizingMaskIntoConstraints = false
        destinationTextField.placeholder = "Local"
        destinationTextField.textContentType = .telephoneNumber
        destinationTextField.keyboardType = .alphabet
        destinationTextField.clearButtonMode = .always
        destinationTextField.delegate = self

        return destinationTextField
    }()

    private lazy var searchAddressOnMapsButton: UIButton = {
        let searchAddressOnMapsButton = UIButton(type: .roundedRect)
        searchAddressOnMapsButton.translatesAutoresizingMaskIntoConstraints = false
        searchAddressOnMapsButton.setTitle("Ver ponto no maps", for: .normal)
        searchAddressOnMapsButton.layer.cornerRadius = 35
        searchAddressOnMapsButton.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        searchAddressOnMapsButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        searchAddressOnMapsButton.addTarget(self, action: #selector(searchAddressOnMapsButtonAction(_ :)), for: .touchUpInside)

        return searchAddressOnMapsButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        view.addSubview(destinationTextField)
        view.addSubview(searchAddressOnMapsButton)

        autoLayout()
    }

    @objc private func searchAddressOnMapsButtonAction(_ sender: UIButton) {
        let vc = MapViewController()
        guard let destination = destinationTextField.text else { return }
        vc.location = destination
        present(vc, animated: true, completion: nil)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension MainViewController {
    private func autoLayout() {
        destinationTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        destinationTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        destinationTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        destinationTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true

        searchAddressOnMapsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchAddressOnMapsButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        searchAddressOnMapsButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        searchAddressOnMapsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        searchAddressOnMapsButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
    }
}

