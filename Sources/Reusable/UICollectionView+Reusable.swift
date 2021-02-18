//
//  UICollectionView+Reusable.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 19/02/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import UIKit

public extension UICollectionView {

    // MARK: - Registration Helpers

    /// Keys used to save associated objects for UICollectionView.
    private enum AssociatedKeys {
        static var registeredCells: UInt8 = 0
        static var registeredSupplementaryViews: UInt8 = 1
    }

    /// Set of ReuseIdentifiers for registered cells in the collection view.
    private var registeredCells: Set<String> {
        get {
            return getAssociatedObject(for: &AssociatedKeys.registeredCells, defaultValue: Set<String>())
        }
        set {
            setAssociatedObject(for: &AssociatedKeys.registeredCells, value: newValue)
        }
    }

    /// Set of ReuseIdentifiers for registered supplementary views in the collection view.
    private var registeredSupplementaryViews: Set<String> {
        get {
            return getAssociatedObject(for: &AssociatedKeys.registeredSupplementaryViews, defaultValue: Set<String>())
        }

        set {
            setAssociatedObject(for: &AssociatedKeys.registeredSupplementaryViews, value: newValue) }
    }

    // MARK: - Cell
    
    /// It registers a cell in the collection view if the cell is NOT registered yet
    private func registerIfNeeded<T: UICollectionViewCell>(_ cell: T.Type) {
        
        guard T.self.viewType != .storyboard else {
            return
        }
        
        if registeredCells.contains(cell.reuseIdentifier) == false {
            register(cell)
        }
    }

    /**
     Register a cell with the collection view using CellType under ReuseIdentifier as identifier.

     - parameter cell: class type to register - subclass of `UICollectionViewCell` conforming `Reusable` protocol

     - seealso: `func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)`

     Registration is done automaticaly under the hood during dequeing cell with
     ````
     func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath,
                                                        with cell: T.Type = T.self,
                                                        configure: ((T) -> Void)? = nil) -> T
     ````
     - Author: Mobilee - Łukasz Szarkowicz
     */
    final private func register<T: UICollectionViewCell>(_ cell: T.Type) {

        registeredCells.insert(cell.reuseIdentifier)
        if case let .nib(nibObject) = cell.viewType {
            register(nibObject, forCellWithReuseIdentifier: cell.reuseIdentifier)
        } else {
            register(cell.self, forCellWithReuseIdentifier: cell.reuseIdentifier)
        }
    }

    /**
     Convenience method to dequeue a reusable cell (`UICollectionViewCell` subclass).
     
     __Design in Storyboard__
    
     If you design your cell in Storyboard, remember to add `DesignedInStoryboard` protocol conformance to the class.
     In Storyboard set cell's identifier to class's name, f.ex. if your class's name is MyCellView, set it to MyCellView.
     
     __Design in XIB or Class__
     
     Cells are automaticaly registered in UICollectionView -- do not register it by yourself.

     - parameter indexPath: the index path defining coordinates of cell.

     - parameter cell: class type to dequeue. Subclass of `UICollectionViewCell`.

     - parameter configure: handler to configure cell after dequeue.

     - seealso: `func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell`

     - Author: Mobilee - Łukasz Szarkowicz
     */
    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath,
                                                       with cell: T.Type = T.self,
                                                       configure: ((T) -> Void)? = nil) -> T {
        
        registerIfNeeded(T.self)
        guard let cellElement = dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
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

    /// It registers a supplementary view in the collection view if the view is NOT registered yet
    private func registerSupplementaryViewIfNeeded<T: UICollectionReusableView>(_ view: T.Type, of kind: String) {
        guard T.self.viewType != .storyboard else {
            return
        }
        
        if registeredSupplementaryViews.contains(view.reuseIdentifier) == false {
            register(view, of: kind)
        }
    }
    
    /**
     Register a supplementary view with the collection view using CellType under ReuseIdentifier as identifier.

     - parameter supplementaryType: class type to register - subclass of `UICollectionReusableView`

     - seealso: `func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String)`

     Registration is done automaticaly under the hood during dequeing view with
     ````
     final func dequeueReusableSupplementaryView<T: UICollectionReusableView>
     (for indexPath: IndexPath,
      with view: T.Type = T.self,
      of kind: String,
      configure: ((T) -> Void)? = nil) -> T
     ````

     - Author: Mobilee - Łukasz Szarkowicz
     */
    final private func register<T: UICollectionReusableView>(_ supplementaryType: T.Type, of kind: String) {

        registeredSupplementaryViews.insert(supplementaryType.reuseIdentifier)

        if case let .nib(nibObject) = supplementaryType.viewType {
            register(nibObject,
                     forSupplementaryViewOfKind: kind,
                     withReuseIdentifier: supplementaryType.reuseIdentifier)
        } else {
            register(supplementaryType.self,
                     forSupplementaryViewOfKind: kind,
                     withReuseIdentifier: supplementaryType.reuseIdentifier)
        }
    }
    
    /**
     Convenience method to dequeue a reusable supplementary view for given type (`UICollectionReusableView` subclass).
     
     - parameter view: class type to dequeue. Subclass of `UICollectionReusableView`.

     - parameter configure: handler to configure view after dequeue.
     
      __IMPORTANT__
     
     Section headers are automaticaly registered in UICollectionView -- do not register it by yourself.
     
      __Design in XIB__
     
     If you design your view in XIB, remember to ceate just 1 view in XIB which is subclass of `UICollectionReusableView`.
     
     1. Add a subview which will be main container and will contain all the rest subviews.
     
     2. Add constraints to main container so it fills entire parent view.
     
     3. Main UICollectionReusableView's subclass view should be has set `Layout` to `Translates mask into constraints`.
     
     4. Change main view background to default -- requirements of iOS, it's been deprecated setting the background color to other than `defualt`.
      
      __Design in Class__
     
     Remember to provide `override init(reuseIdentifier: String?)` implementation as well as `required init?(coder aDecoder: NSCoder)`.

     - seealso: `func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView`

     - Author: Mobilee - Łukasz Szarkowicz
     */
    final func dequeueReusableSupplementaryView<T: UICollectionReusableView>(for indexPath: IndexPath,
                                                                             with view: T.Type = T.self,
                                                                             of kind: String,
                                                                             configure: ((T) -> Void)? = nil) -> T {

        registerSupplementaryViewIfNeeded(T.self, of: kind)
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: view.reuseIdentifier, for: indexPath) as? T else {

            let msg = """
            Failed to deque a supplementary view with reuse identifier:
            \(T.self.reuseIdentifier)
            and matching type:
            \(T.self.self)

            Possible solutions:
                - check if reuseIdentifier is set in your Storyboard or XIB file,
                - check if you registered properly the view type for this collectionView
            """
            fatalError(msg)
        }

        configure?(view)
        return view
    }
}
