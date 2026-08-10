//
//  Distributions.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Foundation
import GameplayKit

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

/*
 makeNormalDistribution
 Generates an array of floating-point values from a normal distribution.
 Uses Box-Muller Transform.
 */
func makeNormalDistribution(
    mu : Float,  // the mean
    sigma: Float,// the deviation
    count: Int,  // the size of the new array
    using src: inout GKARC4RandomSource // preseeded random source
) -> [Float] {
    // edge case
    guard count > 0 else { return [] }
    // initialize empty array
    var values = [Float]()
    values.reserveCapacity(count)
    while values.count < count {
        // generate 2 uniform random numbers between 0 and 1
        var u_1: Float = src.nextUniform()
        let u_2: Float = src.nextUniform()
        // u_1 must be greater than 0
        while u_1 <= .leastNormalMagnitude {
            u_1 = src.nextUniform()
        }
        // box-muller transform for a standard normal variable
        let magnitude = sqrt(-2.0 * log(u_1))
        let z_0 = magnitude * cos(2.0 * .pi * u_2)
        let z_1 = magnitude * sin(2.0 * .pi * u_2)
        // scale by sigma and shift by mu
        values.append(z_0 * sigma + mu)
        // dont apply extra values in case of odd count
        if values.count < count {
            values.append(z_1 * sigma + mu)
        }
    }
    return values
}
