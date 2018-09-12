//
//  ViewController.swift
//  CodableProtocol
//
//  Created by Kelly Galakatos on 9/11/18.
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


    func jsonParser() {
        guard let url = URL(string: "https://dalemusser.com/code/examples/data/nocaltrip/photos.json")
            else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
                else { return }
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(Info.self, from: data)
                
                for photo in json.photos {
                    
                    let newPhoto = Photos(date: photo.date, description: photo.description, image: photo.image, latitude: photo.latitude, longitude: photo.longitude, title: photo.title)
                    
                    self.photoCollection.append(newPhoto)
                    
                    print("Photo \(self.photoCollection.count):")
                    print("Date: \(newPhoto.date)")
                    print("Description: \(newPhoto.description)")
                    print("Image: \(newPhoto.image)")
                    print("Latitude: \(newPhoto.latitude)")
                    print("Longitude: \(newPhoto.longitude)")
                    print("Title: \(newPhoto.title)")
                    print("")
                }
              
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
}

