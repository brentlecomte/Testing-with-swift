//
//  PerformanceTests.swift
//  FirstTests
//
//  Created by Brent Le Comte on 22/12/2020.
//

import XCTest
@testable import First

class PerformanceTests: XCTestCase {

    func testPrimePerformance() {
        measure {
            _ = PrimeCalculator.calculateSync(upTo: 1_000_000)
        }
    }

}
