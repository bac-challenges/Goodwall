//
//  Result.swift
//  GoodwallChallenge
//
//  Created by emile on 17/03/2022.
//

import Foundation

struct Result: Codable {
    let response: Response
}

struct Response: Codable {
    let payload: Payload
}

struct Payload: Codable {
    let entries: [Entry]
}

struct Entry: Codable {
    let item: Post
}
