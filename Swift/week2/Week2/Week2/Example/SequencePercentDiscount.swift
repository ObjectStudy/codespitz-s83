//
//  SequencePercentDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class SequencePercentDiscount: PercentDiscount {
    
    private let sequence: Int

    public init(percent: Double, sequence: Int) {
        self.sequence = sequence
        super.init(percent: percent)
    }
    
    override func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
        return screening.sequence == sequence
    }
}
