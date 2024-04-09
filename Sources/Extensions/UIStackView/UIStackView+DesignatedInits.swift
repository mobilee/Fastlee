//
//  UIStackView+DesignatedInits.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 09/04/2024.
//  Copyright © 2024 Mobilee. All rights reserved.
//

import UIKit

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .vertical, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, subviews: [UIView] = []) {
        
        self.init(frame: .zero)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        subviews.forEach { self.addArrangedSubview($0) }
    }
}

public class VStack: UIStackView {
    public init(distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, subviews: [UIView] = []) {
        
        super.init(frame: .zero)
        self.axis = .vertical
        self.distribution = distribution
        self.spacing = spacing
        subviews.forEach { self.addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

public class HStack: UIStackView {
    public init(distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0, subviews: [UIView] = []) {
        
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = distribution
        self.spacing = spacing
        subviews.forEach { self.addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}



