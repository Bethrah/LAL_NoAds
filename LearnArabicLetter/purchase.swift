//
//  GameScene.swift
//  Learn Arabic Letters
//
//  Created by بدور on ١٤‏/٨‏/٢٠١٧.
//  Copyright © ٢٠١٧ com.bethrah. All rights reserved.
//

import SpriteKit

class purchase: SKScene {
   
    var homeBtn : SKNode?
    
  
    override func didMove(to view: SKView) {
        
        ////
    
    
        homeBtn = self.childNode(withName: "home")
        
     
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
          
            if(homeBtn?.contains(location))!
            {
                if (UIDevice.current.userInterfaceIdiom == .phone){
                    var home = SKScene(fileNamed: "GameScene")
                    home?.scaleMode = .aspectFill
                    self.view?.presentScene(home)
                }else if (UIDevice.current.userInterfaceIdiom == .pad){
                    var home = SKScene(fileNamed: "GameScenePad")
                    home?.scaleMode = .aspectFill
                    self.view?.presentScene(home)
                }
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            let loc = t.location(in: self)
            if(homeBtn?.contains(loc))!{
                var no = homeBtn?.copy() as! SKSpriteNode
                no.zPosition = 5
                self.addChild(no)
                no.run(SKAction.sequence([SKAction.scale(by: 1.3, duration: 0.1),SKAction.removeFromParent()]))
            }
        }
    }
 
}
