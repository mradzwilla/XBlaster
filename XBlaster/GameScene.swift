//
//  GameScene.swift
//  XBlaster
//
//  Created by Michael Radzwilla on 4/24/17.
//  Copyright © 2017 hackingwithswift. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {
    let playerLayerNode = SKNode()
    let hudLayerNode = SKNode()
    let playableRect: CGRect
    let hudHeight: CGFloat = 90
    let scoreLabel = SKLabelNode(fontNamed: "Edit Undo Line BRK")
    var scoreFlashAction: SKAction!
    let healthBarString: NSString = "===================="
    let playerHealthLabel = SKLabelNode(fontNamed: "Arial")
    var playerShip: PlayerShip!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(size: CGSize) {
        // Calculate playable margin
        let maxAspectRatio: CGFloat = 16.0/9.0 //iPhone 5"
        let maxAspectRatioWidth = size.height / maxAspectRatio
        let playableMargin = (size.width-maxAspectRatioWidth) / 2.0
        playableRect = CGRect(x: playableMargin, y: 0,
                              width: size.width - playableMargin / 2, height: size.height - hudHeight)
        super.init(size: size)
        setupSceneLayers()
        setUpUI()
        setupEntities()
    }
    
    func setupSceneLayers() {
        playerLayerNode.zPosition = 50
        hudLayerNode.zPosition = 100
        addChild(playerLayerNode)
        addChild(hudLayerNode)
    }
    
    func setUpUI() {
        let backgroundSize = CGSize(width: size.width, height:hudHeight)
        let backgroundColor = SKColor.black
        let hudBarBackground = SKSpriteNode(color: backgroundColor, size:
            backgroundSize)
        hudBarBackground.position = CGPoint(x:0, y: size.height - hudHeight)
        hudBarBackground.anchorPoint = CGPoint.zero
        hudLayerNode.addChild(hudBarBackground)
        
        scoreLabel.fontSize = 50
        scoreLabel.text = "Score: 0"
        scoreLabel.name = "scoreLabel"
        scoreLabel.verticalAlignmentMode = .center
        scoreLabel.position = CGPoint(
            x: size.width / 2,
            y: size.height - scoreLabel.frame.size.height + 3)
        hudLayerNode.addChild(scoreLabel)
        scoreFlashAction = SKAction.sequence([ SKAction.scale(to: 1.5, duration: 0.1), SKAction.scale(to: 1.0, duration: 0.1)])
        scoreLabel.run( SKAction.repeat(scoreFlashAction, count: 20))
        
        // 1
        let playerHealthBackgroundLabel = SKLabelNode(fontNamed: "Arial")
        playerHealthBackgroundLabel.name = "playerHealthBackground"
        playerHealthBackgroundLabel.fontColor = SKColor.darkGray
        playerHealthBackgroundLabel.fontSize = 50
        playerHealthBackgroundLabel.text = healthBarString as String
        // 2
        playerHealthBackgroundLabel.horizontalAlignmentMode = .left
        playerHealthBackgroundLabel.verticalAlignmentMode = .top
        playerHealthBackgroundLabel.position = CGPoint(
            x: playableRect.minX,
            y: size.height - CGFloat(hudHeight) +
                playerHealthBackgroundLabel.frame.size.height)
        hudLayerNode.addChild(playerHealthBackgroundLabel) // 3
        playerHealthLabel.name = "playerHealthLabel"
        playerHealthLabel.fontColor = SKColor.green
        playerHealthLabel.fontSize = 50
        playerHealthLabel.text = healthBarString.substring(to: 20*75/100)
        playerHealthLabel.horizontalAlignmentMode = .left
        playerHealthLabel.verticalAlignmentMode = .top
        playerHealthLabel.position = CGPoint(
                x: playableRect.minX,
                y: size.height - CGFloat(hudHeight) + playerHealthLabel.frame.size.height)
        hudLayerNode.addChild(playerHealthLabel)
    }
    
    func setupEntities() {
        playerShip = PlayerShip(
        entityPosition: CGPoint(x: size.width / 2, y: 100))
        playerLayerNode.addChild(playerShip)
    }
}
