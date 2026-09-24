//
//  SampleRecordTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 24/08/2026.
//


import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("SampleRecord Tests")
struct SampleRecordTests {
    
    @Test("Encode Successfully To Expected JSON Test")
    func encodeSuccessfullyToExpectedJSON() throws {
        let dist = try DistributionSpecification.makeUniform(
            min: -10.0,
            max: 1.0
        )
        let label = LabelData(distribution: dist)
        let record = SampleRecord(label: label, features: [0.45, -2.0])
        let encoder = JSONEncoder.deterministicEncoder
        
        let data = try encoder.encode(record)
        let jsonString = String(decoding: data, as: UTF8.self)
        let expectedString = """
{
  "features" : [
    0.45,
    -2
  ],
  "label" : {
    "classification" : "uniform",
    "parameters" : {
      "maximum" : 1,
      "minimum" : -10
    }
  }
}
"""
        
        #expect(jsonString == expectedString)
    }
}
