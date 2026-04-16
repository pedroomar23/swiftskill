//
//  url.swift
//  SwiftSkill
//
//  Created by Pedro Omar  on 4/11/26.
//

import Foundation

enum EndpointURL {
    static let urlApi = "https://api.github.com/repos"
    
    case commit
    
    var path: String {
        switch self {
        case .commit:
            return "/OWNER/REPO/commits/REF"
        }
    }
    
    var url: URL {
        return URL(string: EndpointURL.urlApi + path)!
    }
}
