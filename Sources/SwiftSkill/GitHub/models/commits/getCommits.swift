//
//  getCommits.swift
//  SwiftSkill
//
//  Created by Pedro Omar  on 4/11/26.
//

import Foundation

// MARK: - Get Commits

public struct GetCommitResponse: Decodable, Hashable, Encodable, Sendable {
    public let url: String
    public let sha: String
    public let node_id: String
    public let html_url: String
    public let comments_url: String
    public let commit: Commit
    public let author: Authors
}

// MARK: - Commit

public struct Commit: Decodable, Hashable, Encodable, Sendable {
    public let url: String
    public let author: Author
    public let committer: Author
    public let message: String
    public let tree: Tree
    public let comment_count: Int
    public let verification: Verification
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case author = "author"
        case committer = "committer"
        case message = "message"
        case tree = "tree"
        case comment_count = "comment_count"
        case verification = "verfication"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.author = try container.decode(Author.self, forKey: .author)
        self.committer = try container.decode(Author.self, forKey: .committer)
        self.message = try container.decode(String.self, forKey: .message)
        self.tree = try container.decode(Tree.self, forKey: .tree)
        self.comment_count = try container.decode(Int.self, forKey: .comment_count)
        self.verification = try container.decode(Verification.self, forKey: .verification)
    }
    
    public init(url: String, author: Author, committer: Author, message: String, tree: Tree, comment_count: Int, verification: Verification) {
        self.url = url
        self.author = author
        self.committer = committer
        self.message = message
        self.tree = tree
        self.comment_count = comment_count
        self.verification = verification
    }
}

// MARK: - Author

public struct Author: Decodable, Hashable, Encodable, Sendable {
    public let name: String
    public let email: String
    public let date: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case date = "date"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.email = try container.decode(String.self, forKey: .email)
        self.date = try container.decode(String.self, forKey: .date)
    }
    
    public init(name: String, email: String, date: String) {
        self.name = name
        self.email = email
        self.date = date
    }
}

// MARK: - Tree

public struct Tree: Decodable, Hashable, Encodable, Sendable {
    public let url: String
    public let sha: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case sha = "sha"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.sha = try container.decode(String.self, forKey: .sha)
    }
    
    public init(url: String, sha: String) {
        self.url = url
        self.sha = sha
    }
}

// MARK: - Verification

public struct Verification: Decodable, Hashable, Encodable, Sendable {
    public let verified: Bool
    public let reason: String
    public let signature: String?
    public let payload: String?
    public let verified_alt: String?
    
    enum CodingKeys: String, CodingKey {
        case verified = "verified"
        case reason = "reason"
        case signature = "signature"
        case payload = "payload"
        case verified_alt = "verified_alt"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.reason = try container.decode(String.self, forKey: .reason)
        self.signature = try container.decodeIfPresent(String.self, forKey: .signature) ?? ""
        self.payload = try container.decodeIfPresent(String.self, forKey: .payload) ?? ""
        self.verified_alt = try container.decodeIfPresent(String.self, forKey: .verified_alt) ?? ""
    }
    
    public init(verified: Bool, reason: String, signature: String?, payload: String?, verified_alt: String?) {
        self.verified = verified
        self.reason = reason
        self.signature = signature
        self.payload = payload
        self.verified_alt = verified_alt
    }
}

// MARK: - Authors

public struct Authors: Decodable, Hashable, Encodable, Sendable {
    public let login: String
    public let id: Int
    public let node_id: String
    public let avatar_url: String
    public let gravatar_id: String
    public let url: String
    public let html_url: String
    public let followers_url: String
    public let following_url: String
    public let gists_url: String
    public let starred_url: String
    public let suscriptions_url: String
    public let organizations_url: String
    public let repos_url: String
    public let events_url: String
    public let received_events_url: String
    public let type: String
    public let site_admin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case node_id = "node_id"
        case avatar_url = "avatar_url"
        case gravatar_id = "gravatar_id"
        case url = "url"
        case html_url = "html_url"
        case followers_url = "followers_url"
        case following_url = "following_url"
        case gists_url = "gists_url"
        case starred_url = "starred_url"
        case suscriptions_url = "suscriptions_url"
        case organizations_url = "organizations_url"
        case repos_url = "repos_url"
        case events_url = "events_url"
        case received_events_url = "received_events_url"
        case type = "type"
        case site_admin = "siste_admin"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.login = try container.decode(String.self, forKey: .login)
        self.id = try container.decode(Int.self, forKey: .id)
        self.node_id = try container.decode(String.self, forKey: .node_id)
        self.avatar_url = try container.decode(String.self, forKey: .avatar_url)
        self.gravatar_id = try container.decode(String.self, forKey: .gravatar_id)
        self.url = try container.decode(String.self, forKey: .url)
        self.html_url = try container.decode(String.self, forKey: .html_url)
        self.followers_url = try container.decode(String.self, forKey: .followers_url)
        self.following_url = try container.decode(String.self, forKey: .following_url)
        self.gists_url = try container.decode(String.self, forKey: .gists_url)
        self.starred_url = try container.decode(String.self, forKey: .starred_url)
        self.suscriptions_url = try container.decode(String.self, forKey: .suscriptions_url)
        self.organizations_url = try container.decode(String.self, forKey: .organizations_url)
        self.repos_url = try container.decode(String.self, forKey: .repos_url)
        self.events_url = try container.decode(String.self, forKey: .events_url)
        self.received_events_url = try container.decode(String.self, forKey: .received_events_url)
        self.type = try container.decode(String.self, forKey: .type)
        self.site_admin = try container.decode(Bool.self, forKey: .site_admin)
    }
}
