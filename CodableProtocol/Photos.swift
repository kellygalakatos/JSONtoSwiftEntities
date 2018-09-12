//
//  Photos.swift
//  CodableProtocol
//
//  Created by Kelly Galakatos on 9/11/18.
//  Copyright © 2018 Kelly Galakatos. All rights reserved.
//

import UIKit
import Foundation

struct Info : Codable {
    
    enum CodingKeys: String, CodingKey {
        case status
        case photosPath
        case photos
    }
    
    let status: String
    let photosPath: String
    let photos: [Photos]
}


struct Photos : Codable {
    
    
    enum CodingKeys: String, CodingKey {
        case date
        case description
        case image
        case latitude
        case longitude
        case title
    }
    
    let date: String
    let description: String
    let image: String
    let latitude: Double
    let longitude: Double
    let title: String
}



