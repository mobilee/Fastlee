//
//  CollectionCell.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 12/04/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public final class CollectionCell<EmbedView>: UICollectionViewCell where EmbedView: UIView & Reusable {
    public let embedView = EmbedView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Note: This acts as a passthrough, so a CustomView that implements the ReusableGenericView can have it acted upon.
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.embedView.prepareForReuse()
    }
    
    private func setup() {
        contentView.addSubview(embedView)
        embedView.anchor(to: contentView, insets: .zero)
        
        contentView.preservesSuperviewLayoutMargins = false
        contentView.layoutMargins = .zero
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        embedView.layoutSubviews()
    }
    
    @available(iOS 11.0, *)
    public override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        embedView.safeAreaInsetsDidChange()
    }
    
    public override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
}
