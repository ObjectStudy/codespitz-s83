//
//  Reservation.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class Reservation {
    
    let theater: Theater?
    let  movie: Movie?
    let screening: Screening?
    let count: Int

    public init(theater: Theater?, movie: Movie?, screening: Screening?, count: Int) {
        self.theater = theater
        self.movie = movie
        self.screening = screening
        self.count = count
    }
}

extension Reservation {
    static let None = Reservation(theater: nil, movie: nil, screening: nil, count: 0)
}
