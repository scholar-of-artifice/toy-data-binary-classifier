//
//  Distributions.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Foundation

/*
 makeUniformDistribution
 Generates an array of floating-point values from a uniform distribution.
 */
func makeUniformDistribution(
    in range: ClosedRange<Float>,  // the range of values
    count: Int,  // the size of the new array
    using generator: inout RandomNumberGenerator  // the generator to pull from
) -> [Float] {
    guard count > 0 else { return [] }
    return (0..<count).map { _ in
        Float.random(in: range, using: &generator)
    }
}
