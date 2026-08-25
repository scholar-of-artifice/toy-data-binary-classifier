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
            let spec = try DistributionSpecification.makeUniform(min: -1.0, max: 1.0)
        } catch {
            Issue.record(
                "Valid initialization should not throw; received error instead: \(error)"
            )
        }
    }
    
    @Test("Successful Normal Initialization Test")
    func successfulNormalInitialization() {
        do {
            let spec = try DistributionSpecification.makeNormal( mu: 0.0, sigma: 1.0)
        } catch {
            Issue.record(
                "Valid initialization should not throw; received error instead: \(error)"
            )
        }
    }
}
