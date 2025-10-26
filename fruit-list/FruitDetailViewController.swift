//
//  FruitDetailViewController.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-25.
//

import UIKit

class FruitDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dislikesLabel: UILabel!
    
    var fruit: Fruit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
    }
    
    func display() {
        nameLabel.text = fruit?.name
        imageView.image = UIImage(named: fruit?.img ?? "placeholder")
        likesLabel.text = "Likes: \(fruit?.likes, default: "0")"
        dislikesLabel.text = "Dislikes: \(fruit?.dislikes, default: "0")"
    }
    
    @IBAction func likeButton(_ :UIButton) {
        fruit?.likes += 1
        display()
    }
    
    @IBAction func dislikeButton(_ :UIButton) {
        fruit?.dislikes += 1
        display()
    }
}
