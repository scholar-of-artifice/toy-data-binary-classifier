//
//  Factory.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 12/08/2026.
//

import GameplayKit

/// Creates a sample of data using the requested parameters
func createData(
    distribtion_type: String  // TODO: make the interface
) -> [Float] {
    let seed_data: UInt64 = 123_456_789 // TODO: do not hard code
    let s = GKMersenneTwisterRandomSource(seed: seed_data)
    
    // make some data
    var new_data = [Float]() // initialize container for holding data
    // use a function based on distribution_type
    if distribtion_type == "uniform" {
        let r: ClosedRange<Float> = -1.0...1.0
        // make the data
        new_data = makeUniformDistribution(
            in: r,
            count: 30,
            using: s
        )
    } else {
        // make the data
        new_data = makeNormalDistribution(
            mu: 0.0,
            sigma: 1.0,
            count: 30,
            using: s
        )
    }
    // log the data
    NSLog("%@", new_data)
    return new_data
}
