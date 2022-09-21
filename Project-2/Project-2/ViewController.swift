//
//  ViewController.swift
//  Project-2
//
//  Created by Ceren Güneş on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var numberOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        countries.append("estonia")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("ireland")
//        countries.append("italy")
//        countries.append("monaco")
//        countries.append("nigeria")
//        countries.append("poland")
//        countries.append("russia")
//        countries.append("spain")
//        countries.append("uk")
//        countries.append("us")
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
   
    }
    
    func askQuestion(action: UIAlertAction!) {
        
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
//        generates a number between 0 and 2
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) score: \(score)"
       
    }
        
        @IBAction func buttonTapped(_ sender: UIButton) {
            var title: String
            
            numberOfQuestions += 1
            
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
            } else {
                title = "Wrong, that's the flag of \(countries[sender.tag])"
                score -= 1
            }
            
            if numberOfQuestions == 10 {
                let finalAlert = UIAlertController(title: title, message: "Final score: \(score)", preferredStyle: .alert)
                finalAlert.addAction(UIAlertAction(title: "Finished", style: UIAlertAction.Style.cancel))
                present(finalAlert, animated: true)
                
            }
            
            print(numberOfQuestions)
            
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
}

