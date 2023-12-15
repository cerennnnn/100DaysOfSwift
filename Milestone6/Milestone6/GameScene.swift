//
//  GameScene.swift
//  Milestone6
//
//  Created by Ceren Güneş on 15.12.2023.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var scoreLabel: SKLabelNode!
    var possibleTargets = ["ballBlue", "ballCyan", "ballGrey" , "ballGreen", "ballPurple", "ballRed", "ballYellow"]
    var gameTimer: Timer?
    var isGameOver = false
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        background.size = self.frame.size
        addChild(background)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.position = CGPoint(x: 16, y: 32)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(makeTargets), userInfo: nil, repeats: true)
        
        physicsWorld.gravity = .zero
    }
    
    @objc func makeTargets() {
        let height = self.size.height
        let width = self.size.width
        var currentY = height / 3 + 330
        
        for i in 1...3 {
            guard let target = possibleTargets.randomElement() else { return }
            
            let sprite = SKSpriteNode(imageNamed: target)
            sprite.size = CGSize(width: Double.random(in: 50...100), height: Double.random(in: 50...100))
            addChild(sprite)
            
            if i % 2 == 0 {
                sprite.position = CGPoint(x: -sprite.size.width / 2, y: currentY)
                sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
                sprite.physicsBody?.velocity = CGVector(dx: 500, dy: 0)
            } else {
                sprite.position = CGPoint(x: width + sprite.size.width / 2, y: currentY)
                sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
                sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
            }
            
            if target == "ballGrey" {
                sprite.name = "bad"
            } else {
                sprite.name = "good"
            }
            
            currentY -= 210
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)
        
        for node in touchedNodes {
            if let nodeName = node.name {
                
                if nodeName == "good" {
                    score += 1
                } else if nodeName == "bad" {
                    score -= 5
                }
            }
        }
    }
}
