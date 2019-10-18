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
        // 자본금 100원으로 극장을 생성
        let theater = Theater(amount: Money.of(amount: 100.0))
        let movie = Movie(
            // 영화 이름
            // MARK: title: "spiderman" 은 객체지향은 위반
            title: "spiderman",
            // 영화 상영 시간
            runningTime: 120,
            // 영화 예매 금액
            fee: Money.of(amount: 5000.0),
            // MARK: sequence: 1 은 객체지향은 위반
            discountConditions: [SequenceAmountDiscount(amount: Money.of(amount: 1000.0), sequence: 1)]
        )
        
        theater.addMovie(movie: movie)
        
        // 7일 부터 31일까지
        for day in 7..<32 {
            // 10시부터 3시간 간격으로 24시까지
            var hour = 10
            var seq = 1
            while hour < 24 {
                let date = Date().setTime(year: 2019, month: 7, day: day, hour: hour, min: 00, sec: 00)
                // seat 100 은 100좌석만 할당하도록
                let screening = Screening(sequence: seq, whenScreened: date, seat: 100)
                // 상영 시간을 추가한다.
                theater.addScreening(movie: movie, screening: screening)
                seq += 1
                hour += 3
            }
        }
        
        // TicketOffice의 자본금은 0원
        let ticketOffice = TicketOffice(amount: Money.of(amount: 0.0))
        // 계약의 Commission 은 10%
        // MARK: rate: 10.0 은 객체지향은 위반
        theater.contractTicketOffice(ticketOffice: ticketOffice, rate: 10.0)
        let seller = TicketSeller()
        // Seller 와 TicketOffice 계약
        seller.setTicketOffice(ticketOffice: ticketOffice)
        
        let customer = Customer(amount: Money.of(amount: 20000.0))
        
        
        for screening in theater.getScreening(movie: movie) {
            // 고객은 특정 Seller 에게 특정 영화관에서 특정 영화를 2개 예매한다.
            // MARK: count: 2 은 객체지향은 위반
            customer.reserve(seller: seller, theater: theater, movie: movie, screening: screening, count: 2)
            
            // 영화관이 2명의 입장을 판단한다.
            let isOk = theater.enter(customer: customer, count: 2)
            XCTAssertEqual(isOk, true)
            break
        }
    }
}
