//
//  Concentration.swift
//  Concentration_enhanced
//
//  Created by For Programming on 26/12/2017.
//  Copyright © 2017 For Programming. All rights reserved.
//

import Foundation

class Concentration {
    var cards =  [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?    
    var  score: Int
    var flipCount: Int
    var  themes =  [Theme]()
    var theme: Theme =  Theme.init(name: "default", emojis: ["🌰","😂","🍏","🦊","🦁","😎","🍒"])
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs   {
            let card = Card.init()
            self.cards += [card, card]
        }
        
        self.themes.append(Theme.init(name:"faces", emojis: ["😀", "😌", "😍", "😇", "😎", "😂"] ))
        self.themes.append(Theme.init(name: "animals", emojis: ["🐶", "🦁", "🐌", "🦊", "🐫", "🐧"]))
        self.themes.append(Theme.init(name: "flags", emojis: ["🚩", "🇫🇰", "🇪🇬", "🇪🇷", "🇨🇳", "🇨🇦"]))
        self.themes.append(Theme.init(name: "foods", emojis: ["🍏","🍤","🥖","🍋","🍒","🌰"]))
        self.flipCount = 0
        self.score = 0
        theme =  {
            let upperBound = self.themes.count
            let randomIndex = Int(arc4random_uniform(UInt32(upperBound)))
            
            return  self.themes[randomIndex]
            
        }()
        shuffleCards()
        // How to initialize my theme here? Should I initialize my theme here?
        //self.shuffleCards()
        
        //shuffling cards here
    }
    
    func chooseCard(at index: Int) {
        // Check if the  card is matched,  if it isn't continue, else do nothing
        
        if !cards[index].isMatched  {
            flipCount += 1
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier  {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil // because at the end of this process we won't have one card face up
            }
            
            else {
                
                // No card is  faceUp or  two cards are faceUp
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp =  false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
        }
    }
    
   
    func shuffleCards() {
        var shuffled = [Card]()
        for  _ in  self.cards.indices {
            let upperBound = self.cards.count
            let randomIndex = Int(arc4random_uniform(UInt32(upperBound)))
            let  card  = cards.remove(at: randomIndex)
            shuffled += [card]
        }
        
        self.cards =  shuffled
    }
    
    
    
    
    
   
    
}
