//
//  UISegmentedControl+SetupTitles.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 04/10/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

public extension UISegmentedControl {
    
    /**
     Setup titles in UISegmentedControl.
     
     If selectedOption index is lower than number of elements, segment will be selected. Otherwise first segment will be selected if exists.
     */
    func setupTitles(with titles: [String], selectedOption: Int, animated: Bool) {
        guard selectedOption < titles.count else { return }
        removeAllSegments()
        for (index, element) in titles.enumerated() {
            self.insertSegment(withTitle: element,
                               at: index,
                               animated: animated)
        }
        
        if selectedOption < titles.count {
            selectedSegmentIndex = selectedOption
        } else if !titles.isEmpty {
            selectedSegmentIndex = 0
        }
    }
}
