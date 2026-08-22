//
//  RandomSourceExtensions.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation
import GameplayKit

extension Comparable {
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
