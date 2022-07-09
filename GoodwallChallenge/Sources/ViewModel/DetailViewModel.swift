//
//  DetailViewModel.swift
//  GoodwallChallenge
//
//  Created by emile on 17/03/2022.
//

import Foundation

final class DetailViewModel {
    var item: Post?
    
    var items: [String?] {
        
        guard let item = item else {
            return [String]()
        }
        
        return [item.author?.displayName,
                item.author?.location?.formattedAddress,
                item.category,
                item.title,
                item.body,
                "Comments: (\(item.commentCount ?? 0))",
                "Likes: (\(item.likeCount ?? 0))"]
    }
}
