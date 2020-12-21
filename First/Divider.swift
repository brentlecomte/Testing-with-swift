//
//  Divider.swift
//  First
//
//  Created by Brent Le Comte on 29/11/2020.
//

import Foundation

struct Divider {
	func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
		let quotient = number / dividedBy
		let remainder = number % dividedBy
		return (quotient, remainder)
	}
}
