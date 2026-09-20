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
        let record = SampleRecord(label: "label_A", features: [0.45, -2.0])
        let encoder = JSONEncoder()
        let encoder = JSONEncoder.deterministicEncoder
        
        let data = try encoder.encode(record)
        let jsonString = String(decoding: data, as: UTF8.self)
        
        #expect(jsonString == "{\"label\":\"label_A\",\"features\":[0.45,-2]}")
    }
}
