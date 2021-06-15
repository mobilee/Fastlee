//
//  Map+Center.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 15/06/2021.
//  Copyright © 2021 Mobilee. All rights reserved.
//

import MapKit

public extension MKMapView {
    /**
     Center map on given coordinate. You can set radius in _meters_ which refers to zoom level of the map.
     
     - parameter coordinate: _CLLocationCoordinate2D_ parameter defining center point
     - parameter radius: _CLLocationDistance_ parameter defining radius range in meters
     - parameter animated: _Bool_ value defining animation for map changes.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    func center(to coordinate: CLLocationCoordinate2D, radius: CLLocationDistance = 1000, animated: Bool) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        setRegion(region, animated: animated)
    }
    
    /**
     Convenient func for center map on given annotation. You can set radius in _meters_ which refers to zoom level of the map.
     
     - seealso: `func center(to coordinate: CLLocationCoordinate2D, radius: CLLocationDistance = 1000, animated: Bool)`
     
     - parameter coordinate: _CLLocationCoordinate2D_ parameter defining center point
     - parameter radius: _CLLocationDistance_ parameter defining radius range in meters
     - parameter animated: _Bool_ value defining animation for map changes.

     - Author: Mobilee - Łukasz Szarkowicz
     */
    func center(to annotation: MKAnnotation, radius: CLLocationDistance = 1000, animated: Bool) {
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        setRegion(region, animated: animated)
    }
}
