//
//  LabelData.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 21/09/2026.
/// Metadata identifying a sample's target classification and underlying generation specification.
///
/// Use `LabelData` to tag generated fature vectors with their class label and the specific distribution parameters that produce them.
struct LabelData: Encodable {
    /// The string identifier representing the target class name.
    let classification: String

    /// The statistical distribution specification and parameters associated with this label.
    let parameters: DistributionSpecification

    /// Creates a label inferred directly from a distribution.
    ///
    /// The `classification` property defaults to the distribution kind.
    /// - Parameters
    ///     - distribution: The distribution specificaiton defining this sample group.
    init(distribution: DistributionSpecification) {
        self.parameters = distribution
        switch distribution {
            case .uniform:
                self.classification = "uniform"
            case .normal:
                self.classification = "normal"
        }
    }

    /// Creates a label with a custom class identifier and distribution specification.
    ///
    /// The `classification` property defaults to the distribution kind.
    /// - Parameters
    ///     - classification: A custom name or categor assigned to this label.
    ///     - parameters: The distribution specificaiton defining this sample group.
    init(classification: String, parameters: DistributionSpecification) {
        self.classification = classification
        self.parameters = parameters
    }
}
