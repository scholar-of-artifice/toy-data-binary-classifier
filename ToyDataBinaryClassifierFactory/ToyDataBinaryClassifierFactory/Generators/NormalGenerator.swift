//
//  NormalGenerator.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation
import GameplayKit

struct NormalGenerator: DistributionGenerating {
    let mu: Float
    let sigma: Float
    let source: GKRandomSource
    
    func generate(count: Int) -> [Float] {
        guard count > 0 else { return [] }
        // edge case
        guard count > 0 else { return [] }
        // initialize empty array
        var values = [Float]()
        values.reserveCapacity(count)
        while values.count < count {
            // generate 2 uniform random numbers between 0 and 1
            var u_1: Float = source.nextUniform()
            let u_2: Float = source.nextUniform()
            // u_1 must be greater than 0
            while u_1 <= .leastNormalMagnitude {
                u_1 = source.nextUniform()
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
}


