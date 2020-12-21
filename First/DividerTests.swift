//
//  DividerTests.swift
//  FirstTests
//
//  Created by Brent Le Comte on 29/11/2020.
//

import XCTest
@testable import First

class DividerTests: XCTestCase {
	
	var sut: Divider!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		sut = Divider()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testDivide10By3() {
		let dividend = 10
		let dividor = 3
		
		let result = sut.divisionRemainder(of: dividend, dividedBy: dividor)
		
		verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
	}
	
	func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
		XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
		XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
	}

}
