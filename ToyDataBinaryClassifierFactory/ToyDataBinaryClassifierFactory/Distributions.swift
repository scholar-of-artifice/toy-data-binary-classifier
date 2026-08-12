//
//  Distributions.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 05/08/2026.
//

import Foundation
import GameplayKit

internal extension Comparable {
    /*
     Clamps a value to the provided ClosedRange
     */
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}

extension GKRandomSource {
    /*
     Generates a uniform random float within a specified ClosedRange safely.
     */
    func nextFloat(in range: ClosedRange<Float>) -> Float {
        // make a value between 0.0 and 1.0
        let u = Double(self.nextUniform())
        let lower = Double(range.lowerBound)
        let upper = Double(range.upperBound)
        let interpolated = lower + (u * (upper - lower))
        // linear interpolation
        return Float(interpolated).clamped(to: range)
    }
}

/*
 makeUniformDistribution
 Generates an array of floating-point values from a uniform distribution.
 */
func makeUniformDistribution(
    in range: ClosedRange<Float>,  // the range of values
    count: Int,  // the size of the new array
    using src: GKMersenneTwisterRandomSource  // the random source
) -> [Float] {
    // edge case
    guard count > 0 else { return [] }
    // initialize empty array
    var values = [Float]()
    values.reserveCapacity(count)
    while values.count < count {
        values.append(src.nextFloat(in: range))
    }
    return values
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
    using src: GKMersenneTwisterRandomSource // preseeded random source
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
