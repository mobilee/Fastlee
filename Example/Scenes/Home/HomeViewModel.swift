//
//  HomeViewModel.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

struct HomeViewModel {
    // MARK: - Submodels & Values
    
    enum Cell: CaseIterable {
        
        case nibLoadExample
        case reusableCellsExample
        case shadows
        
        
        var title: String {
            switch self {
            case .nibLoadExample:
                return "Load views from NIB example"
            case .reusableCellsExample:
                return "Load reusable cells"
            case .shadows:
                return "Draw shadows to UIViews"
            default:
                return "No title"
            }
        }
    }
    
    var dataSource: [Cell] = Cell.allCases
}
