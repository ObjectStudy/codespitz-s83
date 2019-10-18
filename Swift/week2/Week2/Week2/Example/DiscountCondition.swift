//
//  DiscountCondition.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation


// DiscountCondition 는 능동적 개체가 아니고 수동적 개체이다.

// Iterator 패턴은 능동적 개체가 아니고 수동적 개체이다.
// 수동적 개체로 사용되는 이유는 Lazy 하게 사용하기 위해서이다.
// Iterator 패턴을 사용하는 이유는 Client가 원할 때 hasNext 와 Next 를 호출하기 위함이다.
protocol DiscountCondition {
    // 두 개의 책임 (발동 트리거, 외부에서 조건을 확인)을 가지고 있다.
    
    // isSatisfiedBy 외부에서 발동 트리거 조건을 확인
    func isSatisfiedBy(screening: Screening, audienceCount: Int) -> Bool 
    
    // calculateFee 발동 트리거이다.
    func calculateFee(fee: Money) -> Money
    
}

/*
 인자
 인자를 하나 받는 함수가 가장 좋은 함수이다.
 모든 인자를 추상화해서 객체화 시키면 하나의 인자로 만들 수 있다.
 
 어떤 메소드에게 전달되는 메시지 인자가 2개 이상이라면
  * 메시지가 충분히 추상화되지 않음
  * 메시지가 충분히 형(Type) 이 되지 않음
 
 Interface
 메소드가 아무것도 없는 Interface(Markup Interface) 가 가장 좋은 Interface 이다.
 
 메소드 하나를 갖는 Interface 가 그 다음으로 좋은 Interface 이다.
 
 */
