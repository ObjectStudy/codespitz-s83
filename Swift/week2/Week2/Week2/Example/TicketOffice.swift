//
//  TicketOffice.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation


class TicketOffice: MemoryHashable {
    private var amount: Money
    private var commissionRate = [Theater: Double]()
            
    init(amount: Money) {
        self.amount = amount
    }
    
    func contract(theater: Theater, rate: Double) -> Bool {
        
        if commissionRate.containKey(key: theater) {
            return false
        }
        commissionRate.updateValue(rate, forKey: theater)
        return true
    }
    func cancel(theater: Theater) -> Bool {
        
        if !commissionRate.containKey(key: theater) {
            return false
        }
        commissionRate.removeValue(forKey: theater)
        return true
    }
    
    func reserve(theater: Theater, movie: Movie, screening: Screening, count: Int) -> Reservation {
        if !commissionRate.containKey(key: theater) || !theater.isValidScreening(movie: movie, screening: screening) || !screening.hasSeat(count: count) {
            return Reservation.None
        }
        
        let reservation = theater.reserve(movie: movie, screening: screening, count: count)
        if reservation !== Reservation.None {
            
            let sales = movie.calculateFee(screening: screening, audienceCount: count)
            let commission = sales.multi(times: commissionRate[theater] ?? 1)
            self.amount = self.amount.plus(amount: commission)
            theater.plusAmount(amount: sales.minus(amount: commission))
        }
        return reservation
    }
}
