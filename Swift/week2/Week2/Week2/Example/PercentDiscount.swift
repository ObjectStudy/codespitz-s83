//
//  PercentDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class PercentDiscount: PERCENT, DiscountCondition {
    
    private let percent: Double

    public init(percent: Double) {
        self.percent = percent
    }
    
    func calculateFee(fee: Money) -> Money {
          return fee.minus(amount: fee.multi(times: percent))
      }
      
      func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
          fatalError("Not Imple")
      }
}
