//
//  CodeSpitzExampleTests.swift
//  CodeSpitzExampleTests
//
//  Created by tskim on 04/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import XCTest
@testable import CodeSpitzExample

class CodeSpitzExampleTests: XCTestCase {

    func testInvitation() {
        let theater = Theater(fee: 100);
        let audience = Audience(amount: 0);
        let ticketOffice = TicketOffice(amount: 0);
        let seller = TicketSeller();

        theater.setTicketOffices(ticketOffices: [ticketOffice]);
        theater.setTicket(ticketOffice: ticketOffice, num: 10);
        theater.setInvitation(audience: audience);
        seller.setTicketOffice(ticketOffice: ticketOffice);
        audience.buyTicket(seller: seller);
        let isOk = theater.enter(audience: audience);
        
        XCTAssertEqual(isOk, true)
    }
    
    func testEnterTicketFee() {
         let theater = Theater(fee: 100);
         let audience = Audience(amount: 200);
         let ticketOffice = TicketOffice(amount: 0);
         let seller = TicketSeller();

         theater.setTicketOffices(ticketOffices: [ticketOffice]);
         theater.setTicket(ticketOffice: ticketOffice, num: 10);
         seller.setTicketOffice(ticketOffice: ticketOffice);
         audience.buyTicket(seller: seller);
         let isOk = theater.enter(audience: audience);
         
         XCTAssertEqual(isOk, true)
     }
    
    func xtestFailEnterTicketFee() {
        let theater = Theater(fee: 100);
        let audience = Audience(amount: 50);
        let ticketOffice = TicketOffice(amount: 0);
        let seller = TicketSeller();

        theater.setTicketOffices(ticketOffices: [ticketOffice]);
        theater.setTicket(ticketOffice: ticketOffice, num: 10);
        seller.setTicketOffice(ticketOffice: ticketOffice);
        audience.buyTicket(seller: seller);
        let isOk = theater.enter(audience: audience);
        
        XCTAssertEqual(isOk, false)
    }
}
