//
//  GameScene.swift
//  Bullet Hell
//
//  Created by Alberto He on 3/14/17.
//  Copyright © 2017 Alberto He. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var Player = SKSpriteNode(imageNamed: "Player.png")
    var timer = Timer()
    var enemyTimer = Timer()
    
    override func didMove(to view: SKView) {
        
        Player.position = CGPoint(x: self.size.width / 200, y: self.size.height / 500)
        timer = Timer.scheduledTimer(timeInterval: 0.265, target: self, selector: #selector(GameScene.SpawnBullets), userInfo: nil, repeats: true)
        enemyTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameScene.SpawnEnemies), userInfo: nil, repeats: true)
        
        self.addChild(Player)
    }
    
    func SpawnBullets(){
        let Bullet = SKSpriteNode(imageNamed: "Laser.png")
        Bullet.zPosition = -5
        Bullet.position = CGPoint(x: Player.position.x, y: Player.position.y)
        let action = SKAction.moveTo(y: self.size.height, duration: 0.8)
        Bullet.run(SKAction.repeatForever(action))
        self.addChild(Bullet)
    }
    
    func SpawnEnemies(){
        let Enemy = SKSpriteNode(imageNamed: "EnemyShip.png")
        let MinValue = self.size.width / 8
        let MaxValue = self.size.width - 20
        let SpawnPoint = UInt32(MaxValue - MinValue)
        Enemy.position = CGPoint(x: CGFloat(arc4random_uniform(SpawnPoint)), y: self.size.height)
        self.addChild(Enemy)
    }
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    

    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            let location = touch.location(in: self)
            Player.position.x = location.x
            Player.position.y = location.y
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let location = touch.location(in: self)
            Player.position.x = location.x
            Player.position.y = location.y
        }
    }
    
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
