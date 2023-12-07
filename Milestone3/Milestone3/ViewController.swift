//
//  ViewController.swift
//  Milestone3
//
//  Created by Ceren Güneş on 7.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var scoreLabel: UILabel!
    var titleLabel: UILabel!
    var underscoreLabel: UILabel!
    var userTextField: UITextField!
    var enterButton: UIButton!
    
    var score = 0
    var count = 0
    var allWords = [String]()
    var randomWord: String = ""
    var usedLetter = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWords()
        underscoreLabel.text = getLRandomWordBits()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 48, weight: .semibold)
        titleLabel.text = "HANGMAN"
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.text = "Score: \(score)"
        scoreLabel.font = .systemFont(ofSize: 24, weight: .regular)
        view.addSubview(scoreLabel)
        
        underscoreLabel = UILabel()
        underscoreLabel.translatesAutoresizingMaskIntoConstraints = false
        underscoreLabel.font = .systemFont(ofSize: 36, weight: .bold)
        view.addSubview(underscoreLabel)
        
        userTextField = UITextField()
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.placeholder = "ENTER YOUR GUESS"
        userTextField.isUserInteractionEnabled = true
        userTextField.textAlignment = .center
        userTextField.font = .systemFont(ofSize: 36)
        view.addSubview(userTextField)
        
        enterButton = UIButton(type: .system)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.setTitle("ENTER", for: .normal)
        enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        view.addSubview(enterButton)
        
        constraints()
        
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            underscoreLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 120),
            underscoreLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            userTextField.topAnchor.constraint(equalTo: underscoreLabel.bottomAnchor, constant: 20),
            userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userTextField.heightAnchor.constraint(equalToConstant: 50),
            enterButton.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 50),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: 120),
            enterButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func loadWords() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
    }
    
    func getRandomWord() -> String {
        guard let randomWord = allWords.randomElement() else { return allWords[0] }
        
        return randomWord
    }
    
    func getLRandomWordBits() -> String {
        randomWord = getRandomWord()
        count = randomWord.count
        
        var word = ""
        
        for _ in randomWord {
            word.append("?")
        }
        
        return word
    }
    
    func getUserTextFieldText() -> String? {
        guard let text = userTextField.text else { return "" }
        
        return text
    }
    
    @objc func enterButtonTapped() {
        let text = getUserTextFieldText()
        
        guard let enteredLetter = text?.lowercased().first else { return }
        
        var solutionWord = underscoreLabel.text ?? ""
        var wordGuessed = true
        
        for (index, letter) in randomWord.enumerated() {
            if letter == enteredLetter {
                solutionWord = String(solutionWord.prefix(index) + String(enteredLetter) + solutionWord.suffix(solutionWord.count - index - 1))
                underscoreLabel.text = solutionWord
            }
        }
        
        for letter in solutionWord {
            if letter == "?" {
                wordGuessed = false
                break
            }
        }
        
        if wordGuessed {
            score += 1
            showAlert(title: "Congratulations!", message: "You've guessed the word: \(randomWord)", buttonTitle: "Play again", action: playAgain)
        } else {
            score -= 1
            usedLetter.append(String(enteredLetter))
            underscoreLabel.text = solutionWord
            count -= 1
            showAlert(title: "Careful!", message: "You can guess \(count) times more.", buttonTitle: "OK") { [weak self] _ in
                self?.userTextField.text = ""
            }
            print("You can guess just \(count - 1) times more.")
            
            if count == 0 {
                showAlert(title: "You've out of lives.", message: "Play again", buttonTitle: "Play again", action: playAgain)
            }
        }
    }
    
    func showAlert(title: String, message: String, buttonTitle: String, action: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: action))
        present(ac, animated: true)
    }
    
    func playAgain(action: UIAlertAction) {
        underscoreLabel.text = getLRandomWordBits()
        userTextField.text = ""
    }
}

