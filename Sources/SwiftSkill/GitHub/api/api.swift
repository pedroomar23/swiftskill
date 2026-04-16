//
//  File.swift
//  SwiftSkill
//
//  Created by Pedro Omar  on 4/11/26.
//

import Foundation
import os.log

public class EndpointApi: @unchecked Sendable {
    public static let shared = EndpointApi()
    let logger = Logger()
    let session: URLSession = {
        let delegate = SesionDelegate.shared
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
    
    // MARK: - GET COMMIT
    
    public func getCommit() async {
        
    }
}
