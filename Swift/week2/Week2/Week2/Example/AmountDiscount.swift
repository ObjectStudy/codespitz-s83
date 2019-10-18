//
//  AmountDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class AmountDiscount: AMOUNT, DiscountCondition {
    private let amount: Money

    public init(amount: Money) {
        self.amount = amount
    }
    
    func calculateFee(fee: Money) -> Money {
        return fee.minus(amount: amount)
    }
    
    func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
           fatalError("Not Imple")
     }
     
}
