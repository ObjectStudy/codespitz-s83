//
//  PercentDiscount.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

protocol PercentDiscount: PERCENT, DiscountCondition {

    var percent: Double { get }

    init(percent: Double, sequence: Int)
}

extension PercentDiscount {
    func calculateFee(fee: Money) -> Money {
        return fee.minus(amount: fee.multi(times: percent))
    }
}
