//
//  LabelData.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 21/09/2026.
//

struct LabelData: Encodable {
    let classification: String
    let parameters: DistributionSpecification

    init(distribution: DistributionSpecification) {
        self.parameters = distribution
        switch distribution {
        case .uniform:
            self.classification = "uniform"
        case .normal:
            self.classification = "normal"
        }
    }
    
    // explicit init if you never need custom class names
    init(classification: String, parameters: DistributionSpecification) {
        self.classification = classification
        self.parameters = parameters
    }
}
