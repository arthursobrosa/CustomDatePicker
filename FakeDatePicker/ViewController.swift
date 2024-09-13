//
//  ViewController.swift
//  FakeDatePicker
//
//  Created by Arthur Sobrosa on 12/09/24.
//

import UIKit

class ViewController: UIViewController {
    private let datePicker: FakeDatePicker = {
        let datePicker = FakeDatePicker()
        datePicker.datePickerMode = .time
        datePicker.date = Date()
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        self.setupUI()
    }
}

private extension ViewController {
    func setupUI() {
        self.view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
