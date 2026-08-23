//
//  DistributionGeneratingTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 23/08/2026.
//


import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

// a mock conforming type
struct MockDistributionGenerator: DistributionGenerating {
    let fixedValue: Float
    
    func generate(count: Int) -> [Float] {
        return Array(repeating: fixedValue, count: count)
    }
}

@Suite("DistributionGenerating Tests")
struct DistributionGeneratingTests {
    
    @Test("Generates Correct Count")
    func generatesCorrectCount() {
        let g = MockDistributionGenerator(fixedValue: 2.1)
        let result = g.generate(count: 100)
        #expect(result.count == 100)
    }
    
}
