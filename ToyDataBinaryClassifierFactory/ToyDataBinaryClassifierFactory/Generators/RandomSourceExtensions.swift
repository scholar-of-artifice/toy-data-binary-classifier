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
    
    func randomMu() -> Float {
        let muRange = self.randomMinMaxPair()
        return self.nextFloat(in: muRange)
    }
    
    func randomSigma() -> Float {
        return self.nextFloat(in: 0.0...1.0)
    }
    
    func randomMinMaxPair() -> ClosedRange<Float> {
        // create 2 floating point values
        let gain1 = self.nextFloat(in: -1.0...1.0)
        let gain2 = self.nextFloat(in: -1.0...1.0)
        let val1 = self.nextFloat(in: 0.0...Float.greatestFiniteMagnitude)
        let val2 = self.nextFloat(in: 0.0...Float.greatestFiniteMagnitude)
        let a = gain1 * val1
        let b = gain2 * val2
        if a < b {
            return a...b
        } else {
            return b...a
        }
    }
}
