//
//  PlayerShip.swift
//  XBlaster
//
//  Created by Michael Radzwilla on 4/24/17.
//  Copyright © 2017 hackingwithswift. All rights reserved.
//

import SpriteKit
class PlayerShip: Entity {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(entityPosition: CGPoint) {
        let entityTexture = PlayerShip.generateTexture()!
        super.init(position: entityPosition, texture: entityTexture)
        name = "playerShip"
    }
    
    override class func generateTexture() -> SKTexture? {

        // 1
        class SharedTexture {
            static var texture = SKTexture()
            static let run: Void = {
                let mainShip = SKLabelNode(fontNamed: "Arial")
                mainShip.name = "mainship"
                mainShip.fontSize = 40
                mainShip.fontColor = SKColor.white
                mainShip.text = "▲"
                // 3
                let wings = SKLabelNode(fontNamed: "Arial")
                wings.name = "wings"
                wings.fontSize = 40
                wings.text = "< >"
                wings.fontColor = SKColor.white
                wings.position = CGPoint(x: 1, y: 7)
                // 4
                wings.zRotation = CGFloat(180).degreesToRadians()
                mainShip.addChild(wings)
                // 5
                let textureView = SKView()
                SharedTexture.texture = textureView.texture(from: mainShip)!
                SharedTexture.texture.filteringMode = .nearest
            }()
        }
        
        SharedTexture.run
        return SharedTexture.texture
    }
}
