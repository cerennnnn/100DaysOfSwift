//
//  GameViewController.swift
//  Project29
//
//  Created by Ceren Güneş on 26.12.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var currentGame: GameScene?
    
    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var angleLabel: UILabel!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var launchButton: UIButton!
    
    var player1ScoreLabel: UILabel!
    var player2ScoreLabel: UILabel!
    
    var player1Score = 0 {
        didSet {
            player1ScoreLabel.text = "Player1: \(player1Score)"
        }
    }
    var player2Score = 0 {
        didSet {
            player2ScoreLabel.text = "Player2: \(player2Score)"
        }
    }
    let maxRounds = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                
                currentGame = scene as? GameScene
                currentGame?.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        angleChanged(self)
        velocityChanged(self)
        
        
        player1ScoreLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
        player1ScoreLabel.textColor = UIColor.white
        player1ScoreLabel.text = "Player 1: 0"
        view.addSubview(player1ScoreLabel)
        
        player2ScoreLabel = UILabel(frame: CGRect(x: view.bounds.width - 120, y: 20, width: 100, height: 30))
        player2ScoreLabel.textColor = UIColor.white
        player2ScoreLabel.text = "Player 2: 0"
        view.addSubview(player2ScoreLabel)
    }
    
    func updateScores() {
        player1ScoreLabel.text = "Player 1: \(player1Score)"
        player2ScoreLabel.text = "Player 2: \(player2Score)"
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func angleChanged(_ sender: Any) {
        angleLabel.text = "Angle: \(Int(angleSlider.value))°"
    }
    
    @IBAction func velocityChanged(_ sender: Any) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    
    @IBAction func launch(_ sender: Any) {
        angleSlider.isHidden = true
        angleLabel.isHidden = true
        
        velocitySlider.isHidden = true
        velocityLabel.isHidden = true
        
        launchButton.isHidden = true
        
        currentGame?.launch(angle: Int(angleSlider.value), velocity: Int(velocitySlider.value))
    }
    
    func activatePlayer(number: Int) {
        if number == 1 {
            playerNumber.text = "<<< PLAYER ONE"
        } else {
            playerNumber.text = "<<< PLAYER TWO"
        }
        
        angleSlider.isHidden = false
        angleLabel.isHidden = false
        
        velocitySlider.isHidden = false
        velocityLabel.isHidden = false
        
        launchButton.isHidden = false
    }
}
