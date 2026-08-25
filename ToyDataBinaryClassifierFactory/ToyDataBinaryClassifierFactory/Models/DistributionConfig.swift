//
//  DistributionConfig.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 23/08/2026.
//

import Foundation

struct DistributionConfig: Codable {
    let type: String
    let parameters: [String: Double]
}
