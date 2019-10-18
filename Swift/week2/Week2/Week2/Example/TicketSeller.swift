//
//  TicketSeller.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class TicketSeller {
    var ticketOffice: TicketOffice? = nil

    // 생성자, Setter 에서 받을건지는 신중하게 선택해야 한다.
    func setTicketOffice(ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }

    func reserve(customer: Customer, theater: Theater, movie: Movie, screening: Screening, count: Int) -> Reservation {
        var reservation = Reservation.None
        let price = movie.calculateFee(screening: screening, audienceCount: count)
        if customer.hasAmount(amount: price) {
            reservation = self.ticketOffice?.reserve(theater: theater, movie: movie, screening: screening, count: count) ?? Reservation.None
            if reservation !== Reservation.None {
                customer.minusAmount(amount: price)
            }
        }
        return reservation
    }
}
