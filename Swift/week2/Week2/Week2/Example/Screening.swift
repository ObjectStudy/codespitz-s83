//
//  Screening.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation

class Screening: MemoryHashable {
    private var seat: Int
    let sequence: Int
    let whenScreened: Date

    public init(sequence: Int, whenScreened: Date, seat: Int) {
        self.seat = seat
        self.sequence = sequence
        self.whenScreened = whenScreened
    }
    
    func hasSeat(count: Int) -> Bool {
        return seat >= count
    }
    
    func reserveSeat(count: Int) {
        if hasSeat(count: count) {
            seat -= count
        }
        else {
            fatalError("no seat")
        }
    }
}
//
//extension Screening: Hashable {
//    static func == (lhs: Screening, rhs: Screening) -> Bool {
//        return lhs.hashValue == rhs.hashValue
//    }
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.seat)
//        hasher.combine(self.sequence)
//        hasher.combine(self.whenScreened)
//    }
//
//}
