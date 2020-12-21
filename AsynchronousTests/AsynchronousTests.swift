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
    
    func testPrimesUpTo100ShouldBe25() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25
        
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3)
    }
    
    func testPrimesUpTo100ShouldBe25CorrectOrder() {
        // given
        let maximumCount = 100
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        var primeCounter = 0

        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25

        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            XCTAssertEqual(primes[primeCounter], number)
            expectation.fulfill()
            primeCounter += 1
        }

        wait(for: [expectation], timeout: 3)
    }
    
    func testPrimesUpTo100ShouldBe0WithProgress() {
        let maximumCount = 100
        
        let progress = PrimeCalculator.calculate(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
        }
        
        let predicate = NSPredicate(format: "%@.completedUnitCount == %@", argumentArray: [progress, maximumCount])
        
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testUpgradedPostsNotification() {
        // given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            
            return level == "gold"
        }
        
        // when
        user.upgrade()
        
        // then
        wait(for: [expectation], timeout: 3)
    }

}
