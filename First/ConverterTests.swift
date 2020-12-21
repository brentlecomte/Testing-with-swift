//
//  ConverterTests.swift
//  FirstTests
//
//  Created by Brent Le Comte on 23/11/2020.
//

import XCTest
@testable import First

class ConverterTests: XCTestCase {
	
	var sut: Converter!

    override func setUpWithError() throws {
        sut = Converter()
    }

    override func tearDownWithError() throws {
        sut = nil
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
	
	func test32FahrenheitisZeroCelcius() {
		// Given
		let input = 32.0
		
		// When
		let celcius = sut.convertToCelcius(fahrenheit: input)
		
		// Then
		XCTAssertEqual(celcius, 0, accuracy: 0.000001)
	}
	
	func test212Fahrenheitis100Celcius() {
		// Given
		let input = 212.0
		
		// When
		let celcius = sut.convertToCelcius(fahrenheit: input)
		
		// Then
		XCTAssertEqual(celcius, 100, accuracy: 0.000001)
	}

}
