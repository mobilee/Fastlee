//
//  ExampleClassHeaderView.swift
//  Example
//
//  Created by Lukasz Szarkowicz on 07/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

class ExampleClassHeaderView: UITableViewHeaderFooterView {

    fileprivate var titleLabel: UILabel = UILabel(frame: .zero)

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    fileprivate func commonInit() {
        contentView.backgroundColor = UIColor.white
        addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 26.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12.0).isActive = true
    }

    func update(with title: String) {
        titleLabel.text = title
    }
}
