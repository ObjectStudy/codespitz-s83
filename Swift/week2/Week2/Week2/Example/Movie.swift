//
//  Movie.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class Movie {
    private let title: String
    private let runningTime: TimeInterval
    private let fee: Money
    private let discountConditions: [DiscountPolicy & DiscountCondition]

    public init(title: String, runningTime: TimeInterval, fee: Money, discountConditions: [DiscountPolicy & DiscountCondition]) {
        self.title = title
        self.runningTime = runningTime
        self.fee = fee
        self.discountConditions = discountConditions
    }
    
    func calculateFee(screening: Screening, audienceCount: Int) -> Money {
        for condition in discountConditions {
            if condition.isSatisfiedBy(screening: screening, audienceCount: audienceCount) {
                return condition.calculateFee(fee: self.fee).multi(times: Double(audienceCount))
            }
        }
        return fee.multi(times: Double(audienceCount))
    }
}

extension Movie: Hashable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.title)
        hasher.combine(self.runningTime)
    }
}
