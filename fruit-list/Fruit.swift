//
//  Fruit.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-25.
//

import UIKit

class Fruit: Equatable, Codable {
//    var img: UIImage?
    var name: String
    var likes: Int
    var dislikes: Int
    
    init(name: String, likes: Int, dislikes: Int) {
//        img: UIImage? = nil, 
//        self.img = img
        self.name = name
        self.likes = likes
        self.dislikes = dislikes
    }
}
