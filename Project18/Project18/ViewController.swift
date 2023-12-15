//
//  ViewController.swift
//  Project18
//
//  Created by Ceren Güneş on 15.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I'm inside the viewDidLoad() method.")
        print(1, 2, 3, 4, 5, separator: "-")
        print("Some message", terminator: ".")
        
        //Assert
        /*
        assert(1==1, "Math fails!")
        assert(1==2, "Math fails!")
        assert(myReallySlowMethod() == true, "The slow method returned false.")
         */
        
        //Breakpoints
        for i in 1...100 {
            print("Got number \(i).")
        }
    }


}

