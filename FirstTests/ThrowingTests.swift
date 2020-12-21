//
//  ThrowingTests.swift
//  FirstTests
//
//  Created by Brent Le Comte on 29/11/2020.
//

import XCTest

enum GameError: LocalizedError {
	case notPurchased
	case notInstalled
	case parentalControlDisallowed
}

struct Game {
	let name: String
	
	func play() throws {
		if name == "BioBlitz" {
			throw GameError.notPurchased
		} else if name == "Blastazap" {
			throw GameError.notInstalled
		} else if name == "Dead Storm Rising" {
			throw GameError.parentalControlDisallowed
		} else {
			print("\(name) is OK to play!")
		}
	}
}

class ThrowingTests: XCTestCase {
	func testPlayingBioBlitzThrows() {
		let game = Game(name: "BioBlitz")
		
		do {
			try game.play()
			XCTFail()
		} catch GameError.notPurchased {
			// succes!
		} catch {
			XCTFail()
		}
	}
	
	func testPlayingBlastazapThrows() {
		let game = Game(name: "Blastazap")
		
		XCTAssertThrowsError(try game.play()) {
			error in XCTAssertEqual(error as? GameError, GameError.notInstalled)
		}
	}
	
	func testPlayingExplodingMonkeysDoenstThrow() {
		let game = Game(name: "Exploding Monkeys")
		XCTAssertNoThrow(try game.play())
	}
	
	func testCrashyPlaneDoesntThrow() throws {
		let game = Game(name: "CrashyPlane")
		try game.play()
	}
	
	func testDeadStormRisingThrows() {
		let game = Game(name: "Dead Storm Rising")
		XCTAssertThrowsError(try game.play()) {
			error in XCTAssertEqual(error as? GameError, GameError.parentalControlDisallowed)
		}
	}
}

extension LocalizedError {
	var errorDescription: String? {
		return "\(self)"
	}
}
