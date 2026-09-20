//
//  LinearGradient.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 20/09/2026.
//

import Foundation

/// Generates an array of values
func generateLinearGradient(bounds: ClosedRange<Float>, length: Int) -> [Float]
{
    guard length > 0 else { return [] }
    guard length > 1, bounds.lowerBound != bounds.upperBound else {
        return Array(repeating: bounds.lowerBound, count: length)
    }
    let span = bounds.upperBound - bounds.lowerBound
    let denominator = Float(length - 1)
    return (0..<length).map { i in
        bounds.lowerBound + (Float(i) / denominator) * span
    }
}
