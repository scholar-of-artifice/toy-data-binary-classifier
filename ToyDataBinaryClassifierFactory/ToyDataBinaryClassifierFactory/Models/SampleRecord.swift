//
//  SampleRecord.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 19/08/2026.
//

import Foundation

/// A single synthesized data point. Composed of numerical features and associated labeling.
///
/// Use `SampleRecord` as the core unit emitted by generators and pipelines during dataset export.
struct SampleRecord: Encodable {
    /// The classification and parameter metadata corresponding to this sample.
    let label: LabelData

    /// The array of generated continuous feature values.
    let features: [Double]

    /// Creates a new sample record.
    ///
    /// - Parameters:
    ///     - label: The classification and parameter metadata for this sample.
    ///     - features: The array of continious numerical features.
    init(label: LabelData, features: [Double]) {
        self.label = label
        self.features = features
    }
}
