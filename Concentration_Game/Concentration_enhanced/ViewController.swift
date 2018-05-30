//
//  ViewController.swift
//  Concentration_enhanced
//
//  Created by For Programming on 26/12/2017.
//  Copyright © 2017 For Programming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     @IBOutlet private weak var newGameButton: UIButton!
     @IBOutlet private weak var flipCountLabel: UILabel!
     @IBOutlet private var buttons: [UIButton]!
     lazy var game = Concentration.init(numberOfPairs: buttons.count / 2)
     lazy var emojiChoices = game.theme.emojis
     var emojis: [Int: String] = [:]
    
    
    
    
   
    
    
    @IBAction private  func touchCard(_ sender: UIButton) {
        // what happens when touching a  card: if  the card is faceDown it becomes faceup,  if it is  faceDown, it becomes faceUp
        
        let index = buttons.index(of: sender)!
        
        game.chooseCard(at: index)
        updateViewFromModel()
        
    }
    
    @IBAction private func startANewGame(_ sender: UIButton) {
        game =  Concentration.init(numberOfPairs: buttons.count / 2)
        emojiChoices = game.theme.emojis
        // Get a  new pair of  emojiChoices
        updateViewFromModel()
        
    }
    
    private func  updateViewFromModel() {
        
        // For Cards
        for index in game.cards.indices {
            let button = buttons[index]
            let card = game.cards[index]
            
            if  card.isFaceUp {
                button.setTitle(emoji(for:  card ), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            
            else {
                button.setTitle(nil, for: UIControlState.normal)
                button.backgroundColor =  card.isMatched ?   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.04126320423) :  #colorLiteral(red: 1, green: 0.5606877756, blue: 0.1633287948, alpha: 1)
                
            }
        }
        
        // For flipCount
        flipCountLabel.text = "Flips: " +  String(game.flipCount)
        
    }
    
    
    
    
    func emoji(for card: Card) ->  String {
        print(emojiChoices)
        if emojiChoices.count > 0, emojis[card.identifier] == nil {
            emojis[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emojis[card.identifier] ?? "?"
        
    }
    

}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
            
        }
        
        else if  self < 0 {
           return -Int(arc4random_uniform(UInt32(abs(self))))
            
        }
        
        else {
            return 0
        }
    }
}

