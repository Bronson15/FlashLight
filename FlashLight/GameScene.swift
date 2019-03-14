//
//  GameScene.swift
//  DiveIntoSpriteKit
//
//  Created by Paul Hudson on 16/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import SpriteKit

@objcMembers
class GameScene: SKScene {
    var level = 1
    
    override func didMove(to view: SKView) {
        // this method is called when your game scene is ready to run
        let background = SKSpriteNode(imageNamed: "background-metal")
        background.name = "background"
        background.zPosition = -1
        addChild(background)
        
        createGrid()
        createLevel()
    }
    
    func createGrid() {
        let xOffset = -440
        let yOffset = -300
        
        for row in 0 ..< 8 {
            for col in 0 ..< 12 {
                let item = SKSpriteNode(imageNamed: "red-light")
                item.position = CGPoint(x: xOffset + (col * 80), y: yOffset + (row * 80))
                addChild(item)
            }
        }
    }
    
    func createLevel() {
        var itemsToShow = 4 + level
        
        let items = children.filter { $0.name != "background" }
        
        let shuffled = items.shuffled() as! [SKSpriteNode]
        
        for item in shuffled {
            item.alpha = 0
        }
        
        shuffled[0].name = "correct"
        shuffled[0].alpha = 1
        
        let lights = [SKTexture(imageNamed: "green-light"), SKTexture(imageNamed: "red-light")]
        let change = SKAction.animate(with: lights, timePerFrame: 0.2)
        var delay = 2.0
        
        for i in 1 ..< itemsToShow {
            let item = shuffled[i]
            item.name = "wrong"
            item.alpha = 1
            
            let ourPause = SKAction.wait(forDuration: delay)
            
            let sequence = SKAction.sequence([ourPause, change])
            item.run(sequence)
            
            delay += 0.5
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user touches the screen
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)
        guard let tapped = tappedNodes.first else { return }
        
        if tapped.name == "correct" {
            print("Correct!")
        } else if tapped.name == "wrong" {
            print("Wrong!")
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user stops touching the screen
    }

    override func update(_ currentTime: TimeInterval) {
        // this method is called before each frame is rendered
    }
}

