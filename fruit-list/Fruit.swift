//
//  Fruit.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-25.
//

import UIKit

class Fruit: Equatable, Codable {
    var img: String?
    var name: String
    var likes: Int
    var dislikes: Int
    
    init(img: String, name: String, likes: Int, dislikes: Int) {
        self.img = img
        self.name = name
        self.likes = likes
        self.dislikes = dislikes
    }
    
    static func == (lhs: Fruit, rhs: Fruit) -> Bool {
        return lhs.name == rhs.name
        && lhs.likes == rhs.likes
        && lhs.dislikes == rhs.dislikes
    }
}
