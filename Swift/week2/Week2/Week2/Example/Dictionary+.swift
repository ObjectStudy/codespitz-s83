//
//  Dictionary+.swift
//  Week2
//
//  Created by tskim on 18/10/2019.
//  Copyright © 2019 assin. All rights reserved.
//

import Foundation


extension Dictionary {
    func containKey(key: Key) -> Bool {
        return self[key] != nil
    }
}
