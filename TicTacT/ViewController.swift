//
//  ViewController.swift
//  TicTacT
//
//  Created by Sohayb Khan on 23/09/2017.
//  Copyright © 2017 Sohayb Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var winPrint: UILabel!

    @IBOutlet var winImage: UIImageView!
    @IBOutlet var restartButton: UIButton!
    @IBAction func restart(_ sender: Any) {
        
        gameOn = true
        player = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10
        {
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
            }
        }
        winPrint.isHidden = true
        restartButton.isHidden = true
        winImage.isHidden = true
        
        winPrint.center = CGPoint(x: winPrint.center.x - 500, y: winPrint.center.y)
        restartButton.center = CGPoint(x: restartButton.center.x - 500, y: restartButton.center.y)
        winImage.center = CGPoint(x: winImage.center.x - 500, y: winImage.center.y)
        
    }
    //1 is nought and 2 is crosses
    var gameOn = true	
    var player = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 - empty 1 - nought 2 - cross
    let wins = [[0, 1, 2], [3 ,4 ,5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && gameOn
        {
            gameState[activePosition] = player
            
            if player == 1
            {
                sender.setImage(UIImage(named: "nought.png"), for:[])
                player = 2
            }
            else
            {
                sender.setImage(UIImage(named: "cross.png"), for:[])
                player = 1
            }
        
        }
        
        for win in wins{
            
            
            if gameState[win[0]] == 0 && gameState[win[0]] != gameState[win[1]] && gameState[win[1]] != gameState[win[2]]
            {
                winPrint.isHidden = false
                restartButton.isHidden = false
                winImage.isHidden = false
                
                winPrint.text = "DRAW!!!"
                winImage.image = UIImage(named: "draw.png")
            }
            
            else if gameState[win[0]] != 0 && gameState[win[0]] == gameState[win[1]] && gameState[win[1]] == gameState[win[2]]
            {
                gameOn = false
                
                winPrint.isHidden = false
                restartButton.isHidden = false
                winImage.isHidden = false
                
                if gameState[win[0]] == 1
                {
                    winPrint.text = "Noughts WINS!!!!!"
                    winImage.image = UIImage(named: "nought.png")
                }
                else if gameState[win[0]] == 2
                {
                    winPrint.text = "Crosses WINS!!!!"
                    winImage.image = UIImage(named: "cross.png")
                }
                
                UIView.animate(withDuration: 1, animations: {
                    
                    self.winPrint.center = CGPoint(x: self.winPrint.center.x + 500, y: self.winPrint.center.y)
                    self.restartButton.center = CGPoint(x: self.restartButton.center.x + 500, y: self.restartButton.center.y)
                    self.winImage.center = CGPoint(x: self.winImage.center.x + 500, y: self.winImage.center.y)
                    
                    
                })
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winPrint.isHidden = true
        restartButton.isHidden = true
        winImage.isHidden = true
        
        winPrint.center = CGPoint(x: winPrint.center.x - 500, y: winPrint.center.y)
        restartButton.center = CGPoint(x: restartButton.center.x - 500, y: restartButton.center.y)
        winImage.center = CGPoint(x: winImage.center.x - 500, y: winImage.center.y)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

