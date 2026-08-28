//
//  DataPipeline.swift
//  ToyDataBinaryClassifierFactory
//
//
//  Created by scholar-of-artifice on 27/08/2026.
//

import Foundation

/// A functional contract for generating an array of floating-point values
protocol DataPipeline {
    /// Executes the pipeline's core routine
    func run() throws
}
