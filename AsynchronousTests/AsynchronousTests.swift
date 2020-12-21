//
//  AsynchronousTests.swift
//  AsynchronousTests
//
//  Created by Brent Le Comte on 06/12/2020.
//

import XCTest
@testable import First

class AsynchronousTests: XCTestCase {
	func testPrimesUpTo100ShouldBe0() {
		let maximumCount = 100
		let expectation = XCTestExpectation(description: "Run some async work")
		
		PrimeCalculator.calculate(upTo: maximumCount) {
			XCTAssertEqual($0.count, 25)
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 10)
	}

}
