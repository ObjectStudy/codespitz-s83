//
//  Theater.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation


typealias Long = Int64

class Theater: MemoryHashable {
    private var ticketOffices = [TicketOffice]()
    private var movies = [Movie: [Screening]]()
    private var amount: Money

    init(amount: Money) {
        self.amount = amount
    }

    @discardableResult
    func addMovie(movie: Movie) -> Bool {
        if movies.containKey(key: movie) {
            return false
        }
        movies.updateValue([], forKey: movie)
        return true
    }

    func addScreening(movie: Movie, screening: Screening) {
        if !movies.containKey(key: movie) {
            return
        }
        movies[movie]?.append(screening)
    }


    func contractTicketOffice(ticketOffice: TicketOffice, rate: Double) {
        if ticketOffice.contract(theater: self, rate: rate) {
            return
        }
        ticketOffices.append(ticketOffice)
    }

    func cancelTicketOffice(ticketOffice: TicketOffice) -> Bool {
        if ticketOffices.contains(ticketOffice) || !ticketOffice.cancel(theater: self) {
            return false
        }

        if let atIndex = ticketOffices.firstIndex(of: ticketOffice)  {
            ticketOffices.remove(at: atIndex)
            return true
        }
        return false
    }

    func plusAmount(amount: Money) {
        self.amount = self.amount.plus(amount: amount)
    }

    func getScreening(movie: Movie) -> [Screening] {
        return movies[movie] ?? []
    }

    func isValidScreening(movie: Movie, screening: Screening) -> Bool {
        return movies[movie]?.contains(screening) ?? false
    }

    func enter(customer: Customer, count: Int) -> Bool {
        let reservation = customer.reservation
        
        if let movie = reservation.movie, let screening = reservation.screening {
        return reservation !== Reservation.None &&
            reservation.theater === self &&
            isValidScreening(movie: movie, screening: screening) &&
            reservation.count == count
        }
        return false
    }
    
    func reserve(movie: Movie, screening: Screening, count: Int) -> Reservation {
        if !isValidScreening(movie: movie, screening: screening) || !screening.hasSeat(count: count) {
            return Reservation.None
        }
        
        screening.reserveSeat(count: count)
        return Reservation(theater: self, movie: movie, screening: screening, count: count)
    }
}
