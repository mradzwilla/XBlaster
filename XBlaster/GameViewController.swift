//
//  GameViewController.swift
//  XBlaster
//
//  Created by Michael Radzwilla on 4/24/17.
//  Copyright © 2017 hackingwithswift. All rights reserved.
//

import UIKit
import SpriteKit
class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: CGSize(width: 768,
                                           height: 1024))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
}
