//
//  DiskExporter.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 20/08/2026.
//

import Foundation

class DiskExporter {
    let outDirectory: URL
    let samplesPerShard: Int
    
    private var currentShardIndex = 0
    private var currentSamplesInShard = 0
    private var currentFileHandle: FileHandle?
    private var encoder = JSONEncoder()
    
    init(outDirectory: URL, samplesPerShard: Int = 100_000) throws {
        self.outDirectory = outDirectory
        self.samplesPerShard = samplesPerShard
        
        // create the root directory for the dataset
        try FileManager.default.createDirectory(at: outDirectory, withIntermediateDirectories: true)
    }
    
    /// Writes the top-level manifest file
    func writeManifest(_ manifest: DatasetManifest) throws {
        encoder.outputFormatting = [.prettyPrinted]
        let data = try encoder.encode(manifest)
        let fileURL = outDirectory.appendingPathComponent("manifest.json")
        try data.write(to: fileURL)
        encoder.outputFormatting = [] // reset to compact for .jsonl
    }
    
    /// Appends a single generated sample to the current shard
    func writeSample(_ sample: SampleRecord) throws {
        // rotate to a new file if the current one is full or has not been created
        if currentFileHandle == nil || currentSamplesInShard >= samplesPerShard {
            try rotateShard()
        }
        // encode the sample and append a new line character
        var data = try encoder.encode(sample)
        data.append(contentsOf: [0x0A])
        
        try currentFileHandle?.write(contentsOf: data)
        currentSamplesInShard = currentSamplesInShard + 1
    }
    
    /// Closes the current file and opens a new one
    private func rotateShard() throws {
        try currentFileHandle?.close()
        
        let shardName = String(format: "part-%05d.jsonl", currentShardIndex)
        let fileURL = outDirectory.appendingPathComponent(shardName)
        FileManager.default.createFile(atPath: fileURL.path, contents: nil)
        currentFileHandle = try FileHandle(forWritingTo: fileURL)
        currentShardIndex += 1
        currentSamplesInShard = 0
    }
    
    /// Clean up resources when generation is complete
    func finalize() throws {
        try currentFileHandle?.close()
    }
}
