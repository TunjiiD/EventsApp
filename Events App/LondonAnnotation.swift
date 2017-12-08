//
//  LondonAnnotation.swift
//  Events App
//
//  Created by Adetunji Dosunmu on 08/12/2017.
//  Copyright © 2017 Adetunji Dosunmu. All rights reserved.
//

import Foundation
import MapKit

class LondonAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
