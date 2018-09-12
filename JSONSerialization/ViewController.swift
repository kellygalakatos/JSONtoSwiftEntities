//
//  ViewController.swift
//  JSONSerialization
//
//  Created by Kelly Galakatos on 9/7/18.
//  Copyright © 2018 Kelly Galakatos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photoCollection = [Photos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        jsonParser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    enum JSONError: String, Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
    
    func jsonParser() {
        let urlPath = "https://dalemusser.com/code/examples/data/nocaltrip/photos.json"
        guard let endpoint = URL(string: urlPath) else {
            print("Error creating endpoint")
            return
        }
        URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    throw JSONError.ConversionFailed
                }
        
                if let photoArray = json["photos"] as? [[String: AnyObject]] {
                    for photo in photoArray {
                        let newPhoto = Photos(json: photo)
                        self.photoCollection.append(newPhoto!)
                        
                        print("Photo \(self.photoCollection.count):")
                        print("Date: \(newPhoto!.date)")
                        print("Description: \(newPhoto!.description)")
                        print("Image: \(newPhoto!.image)")
                        print("Latitude: \(newPhoto!.latitude)")
                        print("Longitude: \(newPhoto!.longitude)")
                        print("Title: \(newPhoto!.title)")
                        print("")   
                    }
                }

            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
    
}

