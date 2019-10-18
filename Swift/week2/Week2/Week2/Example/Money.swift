//
//  Money.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class Money {
    private let amount: Double

    public init(amount: Double) {
        self.amount = amount
    }
    
    func minus(amount: Money) -> Money {
        return Money(amount: self.amount > amount.amount ? self.amount - amount.amount : 0.0)
    }
    
    func multi(times: Double) -> Money {
        return Money(amount: self.amount * times)
    }
    
    func plus(amount: Money) -> Money {
        return Money(amount: self.amount + amount.amount)
    }
    
    func greaterThen(amount: Money) -> Bool {
        return self.amount >= amount.amount
    }
    
}

extension Money {
    static func of(amount: Double) -> Money {
        return Money(amount: amount)
    }
}
