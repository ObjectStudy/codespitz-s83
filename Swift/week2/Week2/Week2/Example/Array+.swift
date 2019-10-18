//
//  Array+.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation


extension Array where Element: Equatable {
    func firstContain(value: Element) -> Bool {
        return (self.first { $0 == value } != nil)
    }
}
