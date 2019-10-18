//
//  Customer.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class Customer {
    private let amount: Money
    var reservation = Reservation.None
    
    public init(amount: Money) {
        self.amount = amount
    }

    func reserve(seller: TicketSeller, theater: Theater, movie: Movie, screening: Screening, count: Int) {
        reservation = seller.reserve(customer: self, theater: theater, movie: movie, screening: screening, count: count)
    }
    func hasAmount(amount: Money) -> Bool {
        return self.amount.greaterThen(amount: amount)
    }
    
    @discardableResult
    func minusAmount(amount: Money) -> Money {
        return self.amount.minus(amount: amount)
    }
}
