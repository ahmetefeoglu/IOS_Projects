//
//  Card.swift
//  Concentration_enhanced
//
//  Created by For Programming on 26/12/2017.
//  Copyright © 2017 For Programming. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var  identifier: Int // to identify  a  card
    
    private static var identifierFactory = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
        
    }
    
    private static func getUniqueIdentifier() ->  Int {
        identifierFactory += 1
        return identifierFactory
        
    }
}
