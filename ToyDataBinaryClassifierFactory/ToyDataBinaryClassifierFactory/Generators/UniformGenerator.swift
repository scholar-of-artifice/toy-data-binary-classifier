//
//  UniformGenerator.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation
import GameplayKit

struct UniformGenerator: DistributionGenerating {
    let range: ClosedRange<Float>
    let source: GKRandomSource
    
    func generate(count: Int) -> [Float] {
        // edge case
        guard count > 0 else { return [] }
        //
        var values = [Float]()
        values.reserveCapacity(count)
        while values.count < count {
            values.append(source.nextFloat(in: range))
        }
        return values
    }
}
