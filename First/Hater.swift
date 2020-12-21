//
//  Hater.swift
//  First
//
//  Created by Brent Le Comte on 22/11/2020.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
