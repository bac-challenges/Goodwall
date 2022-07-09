//
//  EndPoint.swift
//  GoodwallChallenge
//
//  Created by emile on 15/03/2021.
//

import Foundation

protocol EndPointType {
    var base: String { get }
    var path: String { get }
    var url: URL { get }
}

enum EndPoint: EndPointType {
    
    case items
    
    var base: String {
        return "https://api.jsonbin.io/b/6230603a061827674377553d"
    }
    
    var path: String {
        switch self {
        case .items: return base
        }
    }
    
    var url: URL {
        switch self {
        case .items: return URL(string: base)!
        }
    }
}
