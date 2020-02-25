//
//  Hands.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Hands {
    
    private var cards: [Card] = []
    var count: Int {
        cards.count
    }
    
    mutating func add(_ card: Card?) {
        guard let card = card else { return }
        cards.append(card)
    }
    
    mutating func removeLast() {
        cards.removeLast()
    }
}