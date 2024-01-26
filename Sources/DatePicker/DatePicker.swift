//
//  DatePicker.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/02/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Combine
import UIKit

@available(iOS 14.0, *)
final public class DatePicker: UIViewController {
    
    public typealias Action = (Date) -> Void
    
    let datePicker = UIDatePicker(frame: .zero)
    
    private var bag = Set<AnyCancellable>()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        datePicker.preferredDatePickerStyle = .inline
        view.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 12.0),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12.0),
            datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12.0),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12.0)
        ])
        
        datePicker.layoutIfNeeded()
    }
    
    public func configure(mode: UIDatePicker.Mode,
                          date: Date?,
                          minimumDate: Date? = nil,
                          maximumDate: Date? = nil) {
        
        datePicker.datePickerMode = mode
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.date = date ?? Date()
    }
    
    public func toAlertController(title: String?, message: String?, sourceView: UIView? = nil, buttonTitle: String, handler: Action?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.setValue(self, forKey: "contentViewController")
        
        let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
        let root = UIApplication.shared.keyWindow?.rootViewController?.view
        
        if let source = sourceView {
            // iPhone
            popoverPresentationController?.sourceView = source
            popoverPresentationController?.sourceRect = source.bounds
        } else if isPad, let source = root, alert.preferredStyle == .actionSheet {
            // iPad
            popoverPresentationController?.sourceView = source
            popoverPresentationController?.sourceRect = CGRect(x: source.bounds.midX,
                                                               y: source.bounds.midY,
                                                               width: 0,
                                                               height: 0)
            popoverPresentationController?.permittedArrowDirections = .init(rawValue: 0)
        }
        
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: { [weak self] _ in
            guard let date = self?.datePicker.date else {
                return
            }
            handler?(date)
        })
        
//        action.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(action)
//        let actionHandler = UIAction { [weak self] action in
//            guard let date = (action.sender as? UIDatePicker)?.date else {
//                return
//            }
//            handler?(date)
//            alert.dismiss(animated: true, completion: nil)
//        }
//        datePicker.addAction(actionHandler, for: .valueChanged)
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        return alert
    }
}
