//
//  Logger.swift
//  Fastlee
//
//  Created by Lukasz Szarkowicz on 31/08/2020.
//  Copyright © 2020 Mobilee. All rights reserved.
//

import Foundation

private class Logger {

    enum LogLevel {
        case error
        case warning
        case success
        case info

        var title: String {
            let startDecorator: String = "--------------------\n"
            switch self {
            case .error:
                return startDecorator.appending("❌ Error occured:")
            case .warning:
                return startDecorator.appending("⚠️ Warning occured:")
            case .success:
                return startDecorator.appending("✅ Success occured:")
            case .info:
                return startDecorator.appending("ℹ️ Information logged:")
            }
        }
    }

    static func print(function: String, file: String, line: Int, message: String?, level: LogLevel) {
        let fileName = file.components(separatedBy: "/").last ?? "Could not detect file"

        let msgDescription = message ?? "No message included"

        let msg = level.title
            + "\n   function: \(function)"
            + "\n   file: \(fileName)"
            + "\n   line: \(line)"
            + "\n   message: \(msgDescription)"
        debugPrint(msg)
    }
}

/**
 Print log for __error__ case.
 
 Log is printed just in __DEBUG__ mode

 - parameter message: String with text to print on console

 - Author: Mobilee - Łukasz Szarkowicz
 */
public func logError(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .error)
    #endif
}

/**
Print log for __warning__ case.

Log is printed just in __DEBUG__ mode

- parameter message: String with text to print on console

- Author: Mobilee - Łukasz Szarkowicz
*/
public func logWarning(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .warning)
    #endif
}

/**
Print log for __success__ case.

Log is printed just in __DEBUG__ mode

- parameter message: String with text to print on console

- Author: Mobilee - Łukasz Szarkowicz
*/
public func logSuccess(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .success)
    #endif
}

/**
Print log for __info__ case.

Log is printed just in __DEBUG__ mode

- parameter message: String with text to print on console

- Author: Mobilee - Łukasz Szarkowicz
*/
public func logInfo(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .info)
    #endif
}
