//
//  SequenceAmountDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class SequenceAmountDiscount: AmountDiscount {
    let sequence: Int

    public init(amount: Money, sequence: Int) {
        self.sequence = sequence
        super.init(amount: amount)
    }
    
    override func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
        return screening.sequence == sequence
    }
    
}
