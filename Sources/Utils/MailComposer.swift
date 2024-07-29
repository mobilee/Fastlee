//
//  MailComposer.swift
//  Fastlee
//
//  Created by Łukasz Szarkowicz on 29/07/2022.
//  Copyright © 2022 Mobilee. All rights reserved.
//

import UIKit

/**
 This is tool for making convenient mail compose.
 
 Initialize object with receiver address. Using the object you can check if composing is available or compose the email using one function.
 
 - Author: Mobilee - Łukasz Szarkowicz
 */
final public class MailComposer {
    
    /// Email address of recipient
    private(set) var recipient: String
    private(set) var subject: String?
    private(set) var body: String?
    
    /**
     URL created for the email composer.
     */
    public var composeUrl: URL? {
        let encodedSubject = subject?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedBody = body?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        return URL(string: "mailto:\(recipient)?subject=\(encodedSubject)&body=\(encodedBody)")
    }
    
    /**
     Check if it is possible to compose an email.
     */
    public var canCompose: Bool {
        guard let url = composeUrl else {
            return false
        }
        
        return UIApplication.shared.canOpenURL(url)
    }
    
    public init(recipientEmail: String, subject: String? = nil, body: String? = nil) {
        self.recipient = recipientEmail
        self.subject = subject
        self.body = body
    }
    
    /**
     Compose an email with the email given during initialization.
     
     - parameter failureHandler: Code block executed in case of any error with provided email. Use this handler to inform user about error with calling.
     
     - requires: The email of recipient has to be correct. It can be check before with `canCompose` parameter.
     
     - Author: Mobilee - Łukasz Szarkowicz
     */
    public func compose(_ failureHandler:(() -> Void)? = nil) {
        guard let url = composeUrl, canCompose == true else {
            failureHandler?()
            presentFailWarning()
            return
        }
        
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    fileprivate func presentFailWarning() {
        let msg = """
        User tried to compose an email to \(self.recipient) with failure.
        Email is incorrect or system could not execute operation.
        """
        logWarning(message: msg)
    }
}
