//
//  DiskExporterTests.swift
//  ToyDataBinaryClassifierFactory
//
//  Created by scholar-of-artifice on 24/08/2026.
//

import Foundation
import Testing

@testable import ToyDataBinaryClassifierFactory

@Suite("DiskExporter Tests")
struct DiskExporterTests {
    
    /// Helper function to create unique temporary directory for each test
    private func getUniqueTemporaryDirectory() -> URL {
        return FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    }
    
    @Test("Creates output directory on initialization")
    func initializationCreatesDirectory() throws {
        let tempDir = getUniqueTemporaryDirectory()
        
        _ = try DiskExporter(outDirectory: tempDir)
        
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: tempDir.path, isDirectory: &isDirectory)
        
        #expect(exists)
        #expect(isDirectory.boolValue)
    }
    
    @Test("Writes manifest.json File")
    func writesManifestFile() throws {
        let tempDir = getUniqueTemporaryDirectory()
        let exporter = try DiskExporter(outDirectory: tempDir)
        
        let manifest = DatasetManifest(datasetName: "test-dataset", totalSamples: 100, featuresPerSample: 2, samplesPerShard: 50, totalShards: 2, classDistributions: [:])
        
        try exporter.writeManifest(manifest)
        
        let manifestURL = tempDir.appendingPathComponent("manifest.json")
        let data = try Data(contentsOf: manifestURL)
        let decodedManifest = try JSONDecoder().decode(DatasetManifest.self, from: data)
        
        #expect(decodedManifest.datasetName == "test-dataset")
        #expect(decodedManifest.totalSamples == 100)
    }
    
    @Test("Correctly writes samples and rotates shards")
    func shardsFilesCorrectly() throws {
        let tempDir = getUniqueTemporaryDirectory()
        let exporter = try DiskExporter(outDirectory: tempDir, samplesPerShard: 2)
        
        let sample00 = SampleRecord(label: "test-label-0", features: [1.0, 2.0])
        let sample01 = SampleRecord(label: "test-label-1", features: [2.0, 2.2])
        let sample02 = SampleRecord(label: "test-label-2", features: [3.0, 2.3])
        
        try exporter.writeSample(sample00)
        try exporter.writeSample(sample01)
        try exporter.writeSample(sample02)
        try exporter.finalize()
        
        let shard00URL = tempDir.appendingPathComponent("part-00000.jsonl")
        let shard01URL = tempDir.appendingPathComponent("part-00001.jsonl")
        
        #expect(FileManager.default.fileExists(atPath: shard00URL.path))
        #expect(FileManager.default.fileExists(atPath: shard01URL.path))
        
        let shard00Contents = try String(contentsOf: shard00URL, encoding: .utf8)
        let shard00Lines = shard00Contents.split(separator: "\n")
        #expect(shard00Lines.count == 2)
        
        let shard01Contents = try String(contentsOf: shard01URL, encoding: .utf8)
        let shard01Lines = shard01Contents.split(separator: "\n")
        #expect(shard01Lines.count == 1)
        
        #expect(shard01Lines.first!.contains("\"label\":\"test-label-2\""))
    }
}
