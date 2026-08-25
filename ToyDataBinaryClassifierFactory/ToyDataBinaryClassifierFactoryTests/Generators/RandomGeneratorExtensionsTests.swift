//
//  RandomGeneratorExtensionsTests.swift
//  ToyDataBinaryClassifierFactoryTests
//
//  Created by scholar-of-artifice on 22/08/2026.
//

import Foundation

import Foundation
import GameplayKit
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("RandomGeneratorExtensions Tests")
struct RandomGeneratorExtensionsTests {
    
    @Test("Clamping Extension Functions Correctly")
    func clampingExtensionFunctionsCorrectly() {
        let range: ClosedRange<Double> = 5.0...10.0
        
        #expect(3.0.clamped(to: range) == 5.0)
        #expect(7.5.clamped(to: range) == 7.5)
        #expect(12.0.clamped(to: range) == 10.0)
    }
    
    @Test("nextFloat Generates Values Within Bounds")
    func nextFloatGeneratesValuesWithinBounds() {
        let rsrc = GKMersenneTwisterRandomSource(seed: 42)
        let range: ClosedRange<Float> = 5.0...10.0
        
        for _ in 0..<100{
            let val = rsrc.nextFloat(in: range)
            #expect(range.contains(val))
        }
    }
    
    @Test("randomSigma Is Within Range Zero To One")
    func randomSigmaIsWithinRangeZeroToOne() {
        let rsrc = GKMersenneTwisterRandomSource(seed: 123)
        
        for _ in 0..<100{
            let val = rsrc.randomSigma()
            #expect(val <= 1.0)
            #expect(val >= 0.0)
        }
    }
    
    @Test("randomMinMax Is Ordered")
    func randomMinMaxIsOrdered() {
        let rsrc = GKMersenneTwisterRandomSource(seed: 5678)
        
        for _ in 0..<100{
            let pair = rsrc.randomMinMaxPair()
            #expect(pair.lowerBound <= pair.upperBound)
        }
    }
}
