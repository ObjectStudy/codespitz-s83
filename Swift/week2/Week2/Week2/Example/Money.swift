//
//  Money.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

/*
 Money 는 값 객체이다.
 Java 예제 코드로 작성했기 때문에 Class 를 사용하고 있다.
 Swift 에서는 struct 키워드를 지원한다.
 
 값 객체는 동시성 문제해서 해방될 수 있다.
 
 값 개체를 쓰는 경우 this.xxx 가 절대 노출되면 안된다.
 (포인터의 포인터로 참조될 수 없기 때문에)
 */
class Money {
    private let amount: Double

    public init(amount: Double) {
        self.amount = amount
    }
    
    func minus(amount: Money) -> Money {
        return Money(amount: self.amount > amount.amount ? self.amount - amount.amount : 0.0)
    }
    
    /*
     Money 를 받는 것과는 달리 이질적으로 times 라는 primitive 자료형을 받고 있다.
     
     */
    func multi(times: Double) -> Money {
        return Money(amount: self.amount * times)
    }
    
    func plus(amount: Money) -> Money {
        return Money(amount: self.amount + amount.amount)
    }
    
    
    func greaterThen(amount: Money) -> Bool {
        return self.amount >= amount.amount
    }
    
}

extension Money {
    static func of(amount: Double) -> Money {
        return Money(amount: amount)
    }
}
