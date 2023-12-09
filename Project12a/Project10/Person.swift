//
//  Person.swift
//  Project10
//
//  Created by Ceren Güneş on 7.12.2023.
//

import UIKit

class Person: NSObject, NSCoding {
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        image = aDecoder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(image, forKey: "image")
    }
}
//universal base class for all cocoatouch classes -> NSObkect(UIViewController, UITableViewController, ...)
