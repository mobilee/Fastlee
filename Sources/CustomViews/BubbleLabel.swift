//
//  BubbleLabel.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 02/02/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit

public class BubbleLabel: UILabel {

    /// Set this value to define inset between text and frame of UILabel.
    public var inset: CGFloat = 6.0

    private var contentInsets: UIEdgeInsets {
        .init(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }


    public override init(frame: CGRect) {
        super .init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    fileprivate func setup() {
        backgroundColor = UIColor.black
        font = .systemFont(ofSize: 14)
        textColor = .white
        textAlignment = .center
        anchorAspectRatio()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        // Rounded corner
        let radius = min(layer.bounds.height/2, layer.bounds.width/2)
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    public func configure(with number: Int) {
        text = number.string
        layoutIfNeeded()
    }

    public override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: contentInsets)
        super.drawText(in: insetRect)
    }

    public override var intrinsicContentSize: CGSize {
        return addInsets(to: super.intrinsicContentSize)
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return addInsets(to: super.sizeThatFits(size))
    }

    private func addInsets(to size: CGSize) -> CGSize {
        let width = size.width + (inset * 2)
        let height = size.height + (inset * 2)
        return CGSize(width: width, height: height)
    }
}
