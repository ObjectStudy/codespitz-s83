//
//  DiscountCondition.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

protocol DiscountCondition {
    func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool 
    
    func calculateFee(fee: Money) -> Money
}
