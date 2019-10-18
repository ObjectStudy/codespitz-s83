//
//  Movie.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

/*
 if 를 제거하는 유일한 방법중 하나는
 외부에 if를 위임하고 외부에서 생성된 객체를 주입받는 것이다.
 
 이름에서 if 조건을 기술하는 것을 알수있다.
 SequencePercentDiscount
 SequenceAmountDiscount
 
 2중 if를 외부에 위임하면서 이름이 기술될 수 있다.
 A: Sequence B: Percent
 
 
 for <-> 재귀 변환하는 것처럼
 Generic <-> if 변환하는 것에 익숙해야한다.
 
 
 */
class Movie: MemoryHashable {
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
