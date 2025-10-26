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
    
    static func addFruit(img: String, name: String, likes: Int, dislikes: Int) {
        let newFruit = Fruit(img: img, name: name, likes: likes, dislikes: dislikes)
        fruits.append(newFruit)
    }
    
    static func load() {
            // Seed default fruits for demo purposes
            self.fruits = [
                Fruit(img: "apple", name: "Apple", likes: 5, dislikes: 2),
                Fruit(img: "banana", name: "Banana", likes: 3, dislikes: 1),
                Fruit(img: "orange", name: "Orange", likes: 4, dislikes: 0),
                Fruit(img: "grapes", name: "Grapes", likes: 2, dislikes: 3),
                Fruit(img: "mango", name: "Mango", likes: 10, dislikes: 1)
            ]
    }

    
}
