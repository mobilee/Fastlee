//
//  URL+EnsureDirExists.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 09/03/2023.
//  Copyright © 2023 Mobilee. All rights reserved.
//

import Foundation

public extension URL {
    /// Check if given dir exists. If not, it creates given directory together with all intermediate directories.
    @discardableResult
    func ensureDirExists() -> Bool {
        // Check if given url type is for files and points on directory.
        guard isFileURL && hasDirectoryPath else {
            return false
        }
        
        var dest: String
        if #available(iOS 16.0, *) {
            dest = self.path(percentEncoded: false)
        } else {
            dest = self.path
        }
            
        if FileManager.default.fileExists(atPath: dest) {
            return true
        } else {
            do {
                try FileManager.default.createDirectory(at: self, withIntermediateDirectories: true)
                return true
            } catch {
                return false
            }
        }
    }
}
