//
//  CodableMemory.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 10/03/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import Foundation

@available(iOS 16.0, *)
@propertyWrapper public struct CodableMemory<T: Codable> {
    
    public let filename: String
    public let dir: URL
    
    var path: String {
        let url = dir.appending(path: filename)
        return url.path(percentEncoded: false)
    }
    
    public var wrappedValue: T? {
        get { load() }
        set { save(value: newValue) }
    }
    
    public init(filename: String, dir: URL) {
        self.filename = filename
        self.dir = dir
    }
    
    private func save(value: T?) {
        print("save to \(dir.appending(path: filename))")
        
        do {
            if fileExists() {
                removeFile()
            }
            
            if let value = value {
                let data = try JSONEncoder().encode(value)
                FileManager.default.createFile(atPath: path, contents: data)
            }
        } catch {
            logError(message: "Could not save file \(filename) at location: \(path)")
            return
        }
    }
    
    func load() -> T? {
        guard fileExists() else {
            return nil
        }
        
        guard let data = FileManager.default.contents(atPath: path) else {
            logError(message: "Cannot load file \(filename) at location: \(path)")
            return nil
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Could not parse file with error: \(error)")
            return nil
        }
    }
    
    /// Check if file exists
    private func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    
    /// Remove file from disk
    private func removeFile() {
        try? FileManager.default.removeItem(atPath: path)
    }
}
