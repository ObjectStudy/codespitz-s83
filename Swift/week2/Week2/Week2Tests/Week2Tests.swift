//
//  Week2Tests.swift
//  Week2Tests
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import XCTest
@testable import Week2

class Week2Tests: XCTestCase {


    func testExample() {
        let theater = Theater(amount: Money.of(amount: 100.0))
        let movie = Movie(
            title: "spiderman",
            runningTime: 120,
            fee: Money.of(amount: 5000.0),
            discountConditions: [SequenceAmountDiscount(amount: Money.of(amount: 1000.0), sequence: 1)]
        )
        
        theater.addMovie(movie: movie)
        
        
        for day in 7..<32 {
            var hour = 10
            var seq = 1
            while hour < 24 {
                let date = Date().setTime(year: 2019, month: 7, day: day, hour: hour, min: 00, sec: 00)
                let screening = Screening(sequence: seq, whenScreened: date, seat: 100)
                theater.addScreening(movie: movie, screening: screening)
                seq += 1
                hour += 3
            }
        }
        
        
        let ticketOffice = TicketOffice(amount: Money.of(amount: 0.0))
        theater.contractTicketOffice(ticketOffice: ticketOffice, rate: 10.0)
        let seller = TicketSeller()
        seller.setTicketOffice(ticketOffice: ticketOffice)
        let customer = Customer(amount: Money.of(amount: 20000.0))
        
        for screening in theater.getScreening(movie: movie) {
            customer.reserve(seller: seller, theater: theater, movie: movie, screening: screening, count: 2)
            let isOk = theater.enter(customer: customer, count: 2)
            XCTAssertEqual(isOk, true)
            break
        }
    }
}
