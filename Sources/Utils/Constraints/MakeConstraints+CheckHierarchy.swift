//
//  MakeConstraints+CheckHierarchy.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 03/07/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import UIKit

public extension UIView {
    /**
     Set flag to **true** when you want to execute fatalError() on constraints error.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    static var shouldFailOnMakeConstraintsError: Bool = false
    
    /**
     Checks if given view is in the same hierarchy as receiver view.
     
     - parameter otherView: UIView to be verified if belongs to the same hierarchy as receiver
     
     - returns: If given view belongs to the same hierarchy as receiver view, returns **true**. If receiver and other view are the same objects, return **false**. If not the same hierarchy returns **false**.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func isInSameHierarchy(with otherView: UIView) -> Bool {
        let selfDescendant = self.isDescendant(of: otherView)
        let otherDescendant = otherView.isDescendant(of: self)
        let differentViews = self !== otherView
        
        return (selfDescendant || otherDescendant) && differentViews
    }
    
    /**
     Checks if given view is in the same hierarchy as receiver view and execute **fatalError()** if **shouldFailOnMakeConstraintsError** is **true**
     
     Usefull for DEVEL mode.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    internal func guardSameHierarchy(for otherView: UIView) {
        if isInSameHierarchy(with: otherView) {
            // Success
            return
        }
        
        let msg = "Views are not in the same view hierarchy. Use addSubview(:) to add child view firstly."
        logError(message: msg)
        if Self.shouldFailOnMakeConstraintsError {
            fatalError(msg)
        }
    }
    
    
    /**
     Checks if receiver view is in the subview hierarchy of given view and both views are not the same.
     
     - parameter otherView: view which is distant parent view of receiver
     
     - returns: If the receiver view is in a subview hierarchy of given view, returns **true**. If receiver and other view are the same objects, return **false**. If not in hierarchy returns **false**.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func isInSubviewsHierarchy(of otherView: UIView) -> Bool {
        return self.isDescendant(of: otherView) && self !== otherView
    }
    
    /**
     Checks if given view is in the same hierarchy as receiver view and execute **fatalError()** if **shouldFailOnMakeConstraintsError** is **true**
     
     Usefull for DEVEL mode.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    internal func guardDescendantHierarchy(of otherView: UIView?) {
        if let otherView = otherView, isInSubviewsHierarchy(of: otherView) {
            // Success
            return
        }
        
        let msg = "View \(self) is not in the other view's subview hierarchy: \(otherView). Use addSubview(:) to add child view firstly."
        logError(message: msg)
        if Self.shouldFailOnMakeConstraintsError {
            fatalError(msg)
        }
    }
}
