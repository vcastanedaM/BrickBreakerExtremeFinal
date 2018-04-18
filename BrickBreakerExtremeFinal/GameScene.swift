//
//  GameScene.swift
//  BrickBreakerExtremeFinal
//
//  Created by Victor Castaneda on 4/12/18.
//  Copyright © 2018 Victor Castaneda. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball = SKShapeNode ()
    var paddle = SKSpriteNode ()
    var loseZone = SKSpriteNode ()
    
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        makeBall()
        makePaddle()
        makeLoseZone()
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.applyImpulse(CGVector(dx: 5 , dy: 5))
    }
        func makeBall() {
            ball = SKShapeNode(circleOfRadius:10)
            ball.position = CGPoint(x: frame.midX, y: frame.midY)
            ball.strokeColor = UIColor.black
            ball.fillColor = UIColor.cyan
            ball.name = "ball"
            
            // physics shape matches ball image
            ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            // ignores all forces and impulses
            ball.physicsBody?.isDynamic = false
            // use precise collision detection
            ball.physicsBody?.usesPreciseCollisionDetection = false
            //no loss of energy from friction
            ball.physicsBody?.friction = 0
            // gravity is not a factor
            ball.physicsBody?.affectedByGravity = false
            // bounces fully off other objects
            ball.physicsBody?.restitution = 1
            // does not slow down over time
            ball.physicsBody?.linearDamping = 0
            ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
            addChild(ball)     // add ball object to the view
        }
        
        func makePaddle() {
            paddle = SKSpriteNode(color: UIColor.white, size: CGSize(width: frame.width / 4, height: 15))
            paddle.position = CGPoint(x: frame.midX, y: frame.midY - 250)
            paddle.name = "paddle"
            paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
            paddle.physicsBody?.isDynamic = false
            addChild(paddle)
        }
        func makeLoseZone() {
            loseZone = SKSpriteNode(color: UIColor.red, size: CGSize(width: frame.width, height: 20))
            loseZone.position = CGPoint(x: frame.midX, y: frame.minY + 25)
            loseZone.name = "loseZone"
            loseZone.physicsBody = SKPhysicsBody(rectangleOf: loseZone.size)
            loseZone.physicsBody?.isDynamic = false
            addChild(loseZone)
    }
}
