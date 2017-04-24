//
//  GameScene.swift
//  XBlaster
//
//  Created by Michael Radzwilla on 4/24/17.
//  Copyright © 2017 hackingwithswift. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let myLabel = SKLabelNode(fontNamed:"Edit Undo Line BRK")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 40
        myLabel.position = CGPoint(x:self.frame.midX,
                                   y:self.frame.midY)
        myLabel.horizontalAlignmentMode = .right
        self.addChild(myLabel)
    }
}
