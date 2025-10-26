//
//  FruitCollection.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-26.
//

import UIKit

class FruitCollection: Codable {
    static var fruits: [Fruit]!

    static func unarchive() {
        do {
            if let file = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FruitCollection") {
                
                fruits = try JSONDecoder().decode([Fruit].self, from: Data(contentsOf: file))
            }
            
        } catch {
            fruits = [Fruit]()
        }
    }
    
    static func archive() {
        if let file = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FruitCollection") {
            try? JSONEncoder().encode(fruits).write(to: file)
        }
    }
    
    static func removeFruit(_ fruit: Fruit) {
        if let index = fruits.firstIndex(of: fruit) {
            fruits.remove(at: index)
        }
    }
    
    static func moveFruit(from: Int, to: Int) {
        if from == to { return }
        
        let movedFruit = fruits[from]
        fruits.remove(at: from)
        fruits.insert(movedFruit, at: to)
    }
    
    static func addFruit(name: String, likes: Int, dislikes: Int) {
        let newFruit = Fruit(name: name, likes: likes, dislikes: dislikes)
        fruits.append(newFruit)
    }
    
}
