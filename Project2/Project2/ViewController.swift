//
//  ViewController.swift
//  Project2
//
//  Created by Ceren Güneş on 1.12.2023.
//

import UIKit
import NotificationCenter

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
        let register = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(registerLocal))
        let notify = UIBarButtonItem(title: "Notify me", style: .plain, target: self, action: #selector(scheduleLocal))
        
        navigationItem.leftBarButtonItems = [register, notify]
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    @objc func registerLocal() {
        //request permission
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Yay!")
            } else {
                print("D'oh!")
            }
        }
    }
    
    @objc func scheduleLocal() {
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Hey, come back!"
        content.body = "We missed you! Come play!"
        content.sound = .default
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "get back here pls"]
        
        var dateComponents = DateComponents()
        dateComponents.weekday = 1
        dateComponents.hour = 10
        dateComponents.minute = 30
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request)
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more", options: .foreground)
        let action = UNNotificationAction(identifier: "alarm", title: "Remind me later", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
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
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                sender.transform = .identity
            }
        }
        
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

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("Custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                print("Default identifier.")
            case "show":
                    print("Show more information...")
            default:
                break
            }
        }
        
        completionHandler()
    }
}
