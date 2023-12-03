//
//  ViewController.swift
//  Project2
//
//  Created by Ceren Güneş on 1.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestions = 0
    var buttonTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    @objc func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) - Score: \(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        buttonTag = sender.tag
        numberOfQuestions += 1
        
        if numberOfQuestions != 5 {
            play()
        } else {
            gameOver()
        }   
    }
    
    func play(action: UIAlertAction! = nil) {
        var title: String
        
        if buttonTag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong, that's the flag of \(countries[buttonTag])"
            score -= 1
        }
        
        showAlert(title: title, message: "Your score is \(score).", buttonTitle: "Continue", action: askQuestion)
    }
    
    func gameOver() {
        showAlert(title: "Game Over!", message: "Your final score is \(score).", buttonTitle: "Play Agan", action: askQuestion)
        score = 0
        numberOfQuestions = 0
    }

    func showAlert(title: String, message: String, buttonTitle: String, action: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: action))
        present(ac, animated: true)
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: ["Share this app with others!"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

