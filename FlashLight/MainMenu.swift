//
//  GameScene.swift
//  DiveIntoSpriteKit
//
//  Created by Paul Hudson on 16/10/2017.
//  Copyright © 2017 Paul Hudson. All rights reserved.
//

import SpriteKit

@objcMembers
class MainMenu: SKScene{
    
    let titleLabel = SKLabelNode(fontNamed: "AvenirNextCondensed-Bold")
    let subTitleLabel = SKLabelNode(fontNamed: "AvenirNextCondensed-Bold")
    let subTitleLabel2 = SKLabelNode(fontNamed: "AvenirNextCondensed-Bold")
    let subTitleLabel3 = SKLabelNode(fontNamed: "AvenirNextCondensed-Bold")
    let music = SKAudioNode(fileNamed: "cool-vibes")
    
    override func didMove(to view: SKView) {
        // this method is called when your game scene is ready to run
        addChild(music)
        let background = SKSpriteNode(imageNamed: "background-metal")
        background.zPosition = -1
        addChild(background)
        
        titleLabel.text = "Main Menu"
        titleLabel.fontSize = 75
        titleLabel.zPosition = 1
        titleLabel.position.y = 150
        addChild(titleLabel)
        
        subTitleLabel.text = "Tap on the square that didn't light up."
        subTitleLabel.fontSize = 30
        subTitleLabel.zPosition = 1
        addChild(subTitleLabel)
        
        subTitleLabel2.text = "Be careful! You only get 3 attempts."
        subTitleLabel2.fontSize = 30
        subTitleLabel2.zPosition = 1
        subTitleLabel2.position.y = -50
        addChild(subTitleLabel2)
        
        subTitleLabel3.text = "Tap to Start!"
        subTitleLabel3.fontSize = 30
        subTitleLabel3.zPosition = 1
        subTitleLabel3.position.y = -100
        addChild(subTitleLabel3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user touches the screen
        if let scene = GameScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene)
        }
    }
}

