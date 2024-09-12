//
//  FakeDatePicker.swift
//  FakeDatePicker
//
//  Created by Arthur Sobrosa on 12/09/24.
//

import UIKit

class FakeDatePicker: UIDatePicker {
    private let dateContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        view.isUserInteractionEnabled = false
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = self.getDateString()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.maximumDate = Date()
        self.datePickerMode = .date
        
        self.addTarget(self, action: #selector(datePickerDidChange), for: .valueChanged)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func datePickerDidChange() {
        self.dateLabel.text = self.getDateString()
    }
    
    private func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.setLocalizedDateFormatFromTemplate("MMddyyyy")

        return dateFormatter.string(from: self.date)
    }
}

private extension FakeDatePicker {
    func setupUI() {
        self.addSubview(dateContainerView)
        self.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateContainerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            dateContainerView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            dateLabel.centerXAnchor.constraint(equalTo: dateContainerView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: dateContainerView.centerYAnchor)
        ])
    }
}
