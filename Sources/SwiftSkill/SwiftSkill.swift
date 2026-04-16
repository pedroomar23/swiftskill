// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// MARK: - Session Delegate

class SesionDelegate: NSObject, URLSessionDelegate, @unchecked Sendable {
    static let shared = SesionDelegate()
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let credentials = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, credentials)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completion: @escaping (URLRequest?) -> Void) {
        var newRequest = request
        newRequest.httpShouldHandleCookies = true
        completion(request)
    }
}
