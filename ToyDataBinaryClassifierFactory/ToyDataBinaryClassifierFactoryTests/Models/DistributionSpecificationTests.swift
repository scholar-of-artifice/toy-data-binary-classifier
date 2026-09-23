//
//  DistributionSpecificationTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 22/08/2026.
//


import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("DistributionSpecification Tests")
struct DistributionSpecificationTests {
    
    @Test("Successful Uniform Initialization Test")
    func successfulUniformInitialization() {
        do {
            _ = try DistributionSpecification.makeUniform(min: -1.0, max: 1.0)
        } catch {
            Issue.record(
                "Valid initialization should not throw; received error instead: \(error)"
            )
        }
    }
    
    @Test("Successful Normal Initialization Test")
    func successfulNormalInitialization() {
        do {
            _ = try DistributionSpecification.makeNormal( mu: 0.0, sigma: 1.0)
        } catch {
            Issue.record(
                "Valid initialization should not throw; received error instead: \(error)"
            )
        }
    }
    
    @Test("Failure Normal Initialization Sigma Is Negative")
    func failsNormalInitializationSigmaIsNegative() {
        #expect(
            throws: DistributionError.invalidStandardDeviation(-1.0)
        ) {
            try DistributionSpecification.makeNormal( mu: 0.0, sigma: -1.0)
        }
    }
    
    @Test("Failure Normal Initialization Sigma Is Zero")
    func failsNormalInitializationSigmaIsZero() {
        #expect(
            throws: DistributionError.invalidStandardDeviation(0.0)
        ) {
            try DistributionSpecification.makeNormal( mu: 0.0, sigma: 0.0)
        }
    }
    
    @Test("Failure Uniform Initialization Min == Max")
    func failsUnifornInitializationMinIsMax() {
        #expect(
            throws: DistributionError.invalidRange(min: 1.0, max: 1.0)
        ) {
            try DistributionSpecification.makeUniform(min: 1.0, max: 1.0)
        }
    }
    
    @Test("Failure Uniform Initialization Min > Max")
    func failsUnifornInitializationMinGreaterThanMax() {
        #expect(
            throws: DistributionError.invalidRange(min: 1.0, max: -11.0)
        ) {
            try DistributionSpecification.makeUniform(min: 1.0, max: -11.0)
        }
    }
}
