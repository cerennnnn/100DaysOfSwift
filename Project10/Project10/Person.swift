//
//  Person.swift
//  Project10
//
//  Created by Ceren Güneş on 7.12.2023.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
//universal base class for all cocoatouch classes -> NSObkect(UIViewController, UITableViewController, ...)
