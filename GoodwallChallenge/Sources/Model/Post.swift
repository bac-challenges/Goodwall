//
//  Post.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import Foundation

struct Post: Codable {
    let author: Author?
    let category: String?
    let title: String?
    let body: String?
    let likeCount: Int?
    let commentCount: Int?
    let comments: [Comment]?
    let hashtags: [String]?
}

struct Author: Codable {
    let displayName: String?
    let location: Location?
}

struct Location: Codable {
    let formattedAddress: String?
}

struct Comment: Codable {
    let author: Author?
    let body: String?
}
