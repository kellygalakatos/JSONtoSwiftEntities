//
//  Photos.swift
//  JSONSerialization
//
//  Created by Kelly Galakatos on 9/10/18.
//  Copyright © 2018 Kelly Galakatos. All rights reserved.
//

import UIKit
import Foundation

struct Photos {
    
    let date: String
    let description: String
    let image: String
    let latitude: Double
    let longitude: Double
    let title: String
}

extension Photos {
    init?(json: [String:AnyObject]) {
        guard let date = json["date"] as? String,
            let description = json["description"] as? String,
            let image = json["image"] as? String,
            let latitude = json["latitude"] as? Double,
            let longitude = json["longitude"] as? Double,
            let title = json["title"] as? String
        else {
            return nil
        }
        
        self.date = date
        self.description = description
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        self.title = title

    }
}
