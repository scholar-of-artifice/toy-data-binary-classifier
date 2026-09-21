//
//  SineGradient.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 20/09/2026.
//

import Foundation

/// Generates an array of values following a sine wave within specified bounds
/// - Parameters:
///     - bounds: the minimum and maximum output values
///     - length: the number of elements in the resulting array
///     - frequency: the number of full sinusoidal periods across the entire array
///     - phase: initial phase offset in radians
///     - decay: a damping factor. higher values means faster decay. 0.0 is constant source.
func generateSineGradient(
    bounds: ClosedRange<Float>,
    length: Int,
    frequency: Float = 1.0,
    phase: Float = 0.0,
    decay: Float = 0.0
) -> [Float] {
    guard length > 0 else { return [] }
    guard length > 1, bounds.lowerBound != bounds.upperBound else {
        return Array(repeating: bounds.lowerBound, count: length)
    }
    let midpoint = (bounds.lowerBound + bounds.upperBound) / 2.0
    let halfSpan = (bounds.upperBound - bounds.lowerBound) / 2.0
    let denominator = Float(length - 1)
    let twoPi = 2.0 * Float.pi
    return (0..<length).map { i in
        // progress x from 0 to 1
        let x = Float(i) / denominator
        let envelope = exp(-decay * x)
        // wave cycle
        let theta = (twoPi * frequency * x)  + phase
        
        return midpoint + sin(theta) * envelope * halfSpan
    }
}
