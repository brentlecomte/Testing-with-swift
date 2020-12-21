//
//  Converter.swift
//  First
//
//  Created by Brent Le Comte on 23/11/2020.
//

import Foundation

struct Converter {
	func convertToCelcius(fahrenheit: Double) -> Double {
		let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
		let celcius = fahrenheit.converted(to: .celsius)
		return celcius.value
	}
}
