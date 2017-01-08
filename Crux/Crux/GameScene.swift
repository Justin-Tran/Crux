//
//  GameScene.swift
//  Crux
//
//  Created by Justin Tran on 1/7/17.
//  Copyright © 2017 JT. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        
        setupTiles()
    }
    
    func setupTiles() {
        let topLeftX = -frame.size.width/2+25
        let topLeftY = frame.size.height/2-25
        
        for y in 0...22 {
            for x in 0...14 {
                let tile = SKSpriteNode(imageNamed: "tile")
                
                tile.position = CGPoint(x: topLeftX + CGFloat(50*x), y: topLeftY - CGFloat(50*y))
                tile.scale(to: CGSize(width: 50, height: 50))
                tile.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
                tile.physicsBody?.isDynamic = false
                
                addChild(tile)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
