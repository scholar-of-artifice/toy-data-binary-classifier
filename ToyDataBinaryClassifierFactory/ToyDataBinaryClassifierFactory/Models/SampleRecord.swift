//
//  SampleRecord.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

struct SampleRecord: Encodable {
    let label: LabelData
    let features: [Double]
}
