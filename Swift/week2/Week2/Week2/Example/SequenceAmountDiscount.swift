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

/*
 상속의 한계는 병합되어있는 경우의 수의 모든 코드 중복을 제거할 방식이 없다.
 코드 중복을 제거하기 위해서는 전략 개체로 사용하는 방법밖에 없다.
 
 class SequenceAmountDiscount: AmountDiscount {
     override func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
         return screening.sequence == sequence
     }
 }
 
 class SequencePercentDiscount: AmountDiscount {
     override func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool {
         return screening.sequence == sequence
     }
 }
 */
