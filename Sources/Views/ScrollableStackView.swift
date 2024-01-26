//
//  ScrollableStackView.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 11/01/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public class ScrollableStackView: UIView {
    
    public let scrollView: UIScrollView = UIScrollView()
    public let stackView: UIStackView = UIStackView()
    
    // MARK: - Configuration
    public var axis: NSLayoutConstraint.Axis {
        get { stackView.axis }
        set { stackView.axis = newValue }
    }
    
    public var distribution: UIStackView.Distribution {
        get { stackView.distribution }
        set { stackView.distribution = newValue }
    }
    
    public var alignment: UIStackView.Alignment {
        get { stackView.alignment }
        set { stackView.alignment = newValue }
    }
    
    public var spacing: CGFloat {
        get { stackView.spacing }
        set { stackView.spacing = newValue }
    }
    
    // MARK: - Initialise
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Setup
    
    fileprivate func setup() {
        setupScrollView()
        setupStackView()
        setupConstraints()
//        setupKeyboardHideActions()
//        setupKeyboardObserver()
    }
    
    fileprivate func setupScrollView() {
        addSubview(scrollView)
    }
    
    fileprivate func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.axis = .vertical
    }
    
    fileprivate func setupConstraints() {
        var constr = [NSLayoutConstraint]()
        
        // Scroll View Constraints
        constr += scrollView.constraintsEqual(to: self)
//        constr += scrollView.constraints(width: widthAnchor, height: heightAnchor)
        
        // Stack View Constraints
        constr += stackView.constraintsEqual(to: scrollView.safeAreaLayoutGuide)
//        constr += stackView.constraints(width: widthAnchor)
        
        let heightConstraint = stackView.heightAnchor.constraint(equalTo: heightAnchor)
        heightConstraint.priority = .init(250)
        
        constr += [heightConstraint]
        
        constr.activateAll()
    }
    
    // MARK: - Public functions
    
    public func insertArrangedSubview(_ view: UIView, at index: Int) {
        stackView.insertArrangedSubview(view, at: index)
    }
    
    public func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    public func addArrangedSubviews(_ views: UIView...) {
        stackView.addArrangedSubviews(views)
    }
    
    public func addArrangedSubviews(_ views: [UIView]) {
        stackView.addArrangedSubviews(views)
    }
    
    public func insertArrangedSubview(_ view: UIView, after arrangedSubview: UIView) {
        stackView.insertArrangedSubview(view, after: arrangedSubview)
    }
    
    public func addSpacer(after arrangedSubview: UIView? = nil) {
        stackView.addSpacer(after: arrangedSubview)
    }
    
    public func setCustomSpacing(_ spacing :CGFloat, after arrangedSubview: UIView) {
        stackView.setCustomSpacing(spacing, after: arrangedSubview)
    }
    
    public func customSpacing(after arrangedSubview: UIView) -> CGFloat {
        stackView.customSpacing(after: arrangedSubview)
    }
}
