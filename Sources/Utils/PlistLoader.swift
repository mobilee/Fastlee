//
//  PlistLoader.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 29/11/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import Foundation

public class PlistLoader<T: Decodable> {
    public static func parseFile(named fileName: String) -> T {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
              let fileData = FileManager.default.contents(atPath: filePath)
        else {
            fatalError("Plist file '\(fileName)' not loadable!")
        }
        
        do {
            let config = try PropertyListDecoder().decode(T.self, from: fileData)
            return config
        } catch {
            fatalError("Configuration not decodable from '\(fileName)': \(error)")
        }
    }
}
