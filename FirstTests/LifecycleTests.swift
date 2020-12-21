//
//  LifecycleTests.swift
//  FirstTests
//
//  Created by Brent Le Comte on 23/11/2020.
//

import XCTest

class LifecycleTests: XCTestCase {

    override func setUpWithError() throws {
		print("In class setUp.")    }

    override func tearDownWithError() throws {
		print("In class tearDown.")    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	

	override func setUp() {
		print("In setUp.")
	}

	override func tearDown() {
		print("In tearDown.")
	}

	func testExample() {
		print("Starting test.")

		addTeardownBlock {
			print("In first tearDown block.")
		}

		print("In middle of test.")

		addTeardownBlock {
			print("In second tearDown block.")
		}

		print("Finishing test.")
	}
}
