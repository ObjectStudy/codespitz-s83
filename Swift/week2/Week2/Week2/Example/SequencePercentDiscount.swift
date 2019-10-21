//
//  SequencePercentDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class SequencePercentDiscount: PercentDiscount {
    var percent: Double
    
    let sequence: Int

    required init(percent: Double, sequence: Int) {
        self.sequence = sequence
        self.percent = percent
    }
    
    func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
        return screening.sequence == sequence
    }
}
