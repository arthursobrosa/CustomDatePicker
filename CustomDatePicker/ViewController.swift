//
//  ViewController.swift
//  CustomDatePicker
//
//  Created by Arthur Sobrosa on 26/11/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Properties

    /// Customize your date picker here
    private lazy var customDatePicker: CustomDatePicker = {
        let datePicker = CustomDatePicker()
        datePicker.delegate = self
        datePicker.datePickerMode = .date
        datePicker.fontWeight = .bold
        datePicker.layer.borderWidth = 2
        datePicker.layer.borderColor = UIColor.label.cgColor
        datePicker.layer.cornerRadius = 10
        datePicker.backgroundColor = .systemCyan
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Custom Date Picker Delegate

extension ViewController: CustomDatePickerDelegate {
    // Handle methods here
}

// MARK: - UI Setup

extension ViewController {
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(customDatePicker)
        
        NSLayoutConstraint.activate([
            customDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customDatePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

