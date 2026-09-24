//
//  LabelDataTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 23/09/2026.
//


import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("LabelData Tests")
struct LabelDataTests {
    
    @Test("Convenience init derive 'uniform' classification and preserves parameters")
    func testUniformConvenienceInitialization() throws {
        let dist = try DistributionSpecification.makeUniform(min: -10.0, max: 2.3)
        let labelData = LabelData(distribution: dist)
        #expect(labelData.classification == "uniform")
    }
    
    @Test("Convenience init derive 'uniform' classification and preserves parameters")
    func testNormalConvenienceInitialization() throws {
        let dist = try DistributionSpecification.makeNormal(mu: 1.0, sigma: 0.1)
        let labelData = LabelData(distribution: dist)
        #expect(labelData.classification == "normal")
    }
    
    @Test("Explicit init derive 'uniform' classification and preserves parameters")
    func testExplicitInitialization() throws {
        let dist = try DistributionSpecification.makeNormal(mu: 1.0, sigma: 0.1)
        let labelData = LabelData(classification: "asdf", parameters: dist)
        #expect(labelData.classification == "asdf")
    }
    
}
