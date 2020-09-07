//
//  UITableView+Reusable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 02/09/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import UIKit

public extension UITableView {

    // MARK: - Registration Helpers

    /// Keys used to save associated objects for UITableView.
    private enum AssociatedKeys {
        static var registeredCells: UInt8 = 0
        static var registeredHeaderFooterViews: UInt8 = 1
    }

    /// Set of ReuseIdentifiers for registered cells in the table view.
    private var registeredCells: Set<String> {
        get {
            return getAssociatedObject(for: &AssociatedKeys.registeredCells, defaultValue: Set<String>())
        }
        set {
            setAssociatedObject(for: &AssociatedKeys.registeredCells, value: newValue)
        }
    }

    /// Set of ReuseIdentifiers for registered header and footer views in the table view.
    private var registeredHeaderFooterViews: Set<String> {
        get {
            return getAssociatedObject(for: &AssociatedKeys.registeredHeaderFooterViews, defaultValue: Set<String>())
        }

        set {
            setAssociatedObject(for: &AssociatedKeys.registeredHeaderFooterViews, value: newValue) }
    }

    // MARK: - Cell
    
    /// It registers a cell in the table view if the cell is NOT registered yet
    private func registerIfNeeded<T: UITableViewCell>(_ cell: T.Type) {
        
        guard T.self.viewType != .storyboard else {
            return
        }
        
        if registeredCells.contains(cell.reuseIdentifier) == false {
            register(cell)
        }
    }

    /**
     Register a cell with the table view using CellType under ReuseIdentifier as identifier.

     - parameter cell: class type to register - subclass of `UITableViewCell` conforming `Reusable` protocol

     - seealso: `func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)`

     Registration is done automaticaly under the hood during dequeing cell with
     ````
     final func dequeueReusableCell<T>(for indexPath: IndexPath,
     with cell: T.Type = T.self,
     configure: ((T) -> Void) = { _ in }) -> T where T : UITableViewCell
     ````
     - Author: Mobilee - Łukasz Szarkowicz
     */
    final private func register<T: UITableViewCell>(_ cell: T.Type) {

        registeredCells.insert(cell.reuseIdentifier)
        if case let .nib(nibObject) = cell.viewType {
            register(nibObject, forCellReuseIdentifier: cell.reuseIdentifier)
        } else {
            register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
        }
    }

    /**
     Convenience method to dequeue a reusable cell (`UITableViewCell` subclass).
     
     __Design in Storyboard__
    
     If you design your cell in Storyboard, remember to add `DesignedInStoryboard` protocol conformance to the class.
     In Storyboard set cell's identifier to class's name, f.ex. if your class's name is MyCellView, set it to MyCellView.
     
     __Design in XIB or Class__
     
     Cells are automaticaly registered in UITableView -- do not register it by yourself.

     - parameter indexPath: the index path defining coordinates of cell.

     - parameter cell: class type to dequeue. Subclass of `UITableViewCell`.

     - parameter configure: handler to configure cell after dequeue.

     - seealso: `func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell`

     - Author: Mobilee - Łukasz Szarkowicz
     */
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath,
                                                       with cell: T.Type = T.self,
                                                       configure: ((T) -> Void)? = nil) -> T {
        
        registerIfNeeded(T.self)
        guard let cellElement = self.dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
            let msg = """
            Failed to deque a reusable cell with reuse identifier:
            \(T.self.reuseIdentifier)
            and matching type:
            \(T.self.self)

            Possible solutions:
            - check if reuseIdentifier is set in your Storyboard or XIB file,
            """
            fatalError(msg)
        }

        configure?(cellElement)
        return cellElement
    }

    // MARK: - Header / Footer View

    /// It registers a header or footer view in the table view if the view is NOT registered yet
    private func registerHeaderFooterViewIfNeeded<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        if registeredHeaderFooterViews.contains(view.reuseIdentifier) == false {
            register(view)
        }
    }
    
    /**
     Register a header or footer with the table view using CellType under ReuseIdentifier as identifier.

     - parameter headerFooter: class type to register - subclass of `UITableViewHeaderFooterView`

     - seealso: `func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)`

     Registration is done automaticaly under the hood during dequeing view with
     ````
     final func dequeueReusableHeaderFooterView<T>(for view: T.Type = T.self,
     configure: ((T) -> Void) = { _ in }) -> T
     where T : UITableViewHeaderFooterView
     ````

     - Author: Mobilee - Łukasz Szarkowicz
     */
    final private func register<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) {

        registeredHeaderFooterViews.insert(headerFooter.reuseIdentifier)

        if case let .nib(nibObject) = headerFooter.viewType {
            register(nibObject, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
        } else {
            register(headerFooter.self, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
        }
    }
    
    /**
     Convenience method to dequeue a reusable header/footer view for given type (`UITableViewHeaderFooterView` subclass).
     
     - parameter view: class type to dequeue. Subclass of `UITableViewHeaderFooterView`.

     - parameter configure: handler to configure view after dequeue.
     
      __IMPORTANT__
     
     Section headers are automaticaly registered in UITableView -- do not register it by yourself.
     
      __Design in XIB__
     
     If you design your view in XIB, remember to ceate just 1 view in XIB which is subclass of `UITableViewHeaderFooterView`.
     
     1. Add a subview which will be main container and will contain all the rest subviews.
     
     2. Add constraints to main container so it fills entire parent view.
     
     3. Main UITableViewHeaderFooterView's subclass view should be has set `Layout` to `Translates mask into constraints`.
     
     4. Change main view background to default -- requirements of iOS, it's been deprecated setting the background color to other than `defualt`.
     
     5. In UITableViewDelegate set `heightForHeaderInSection` to `UITableView.automaticDimension` and provide `estimatedHeightForHeaderInSection`.
      
      __Design in Class__
     
     Remember to provide `override init(reuseIdentifier: String?)` implementation as well as `required init?(coder aDecoder: NSCoder)`.

     - seealso: `func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView?`

     - Author: Mobilee - Łukasz Szarkowicz
     */
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for view: T.Type = T.self,
                                                                               configure: ((T) -> Void)? = nil) -> T {

        registerHeaderFooterViewIfNeeded(T.self)
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: view.reuseIdentifier) as? T else {

            let msg = """
            Failed to deque view with reuse identifier:
            \(T.self.reuseIdentifier)
            and matching type:
            \(T.self.self)

            Possible solutions:
                - check if reuseIdentifier is set in your Storyboard or XIB file,
            """
            fatalError(msg)
        }

        configure?(view)
        return view
    }
}
