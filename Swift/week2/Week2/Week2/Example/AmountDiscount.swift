//
//  AmountDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

protocol AmountDiscount: AMOUNT, DiscountCondition {
    var amount: Money { get }

    init(amount: Money, sequence: Int)
    
    func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool
}

extension AmountDiscount {
    func calculateFee(fee: Money) -> Money {
        return fee.minus(amount: amount)
    }
}

