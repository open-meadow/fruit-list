//
//  FruitFromViewController.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-25.
//

import UIKit

class FruitFormViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var likesTextField: UITextField!
    @IBOutlet weak var dislikesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "placeholder")
    }
    
    // Create new item from input fields when button is pressed
    @IBAction func input(_ sender: UIButton) {
        let newName = nameTextField.text ?? ""
        let newLikes = Int(likesTextField.text ?? "0") ?? 0
        let newDislikes = Int(dislikesTextField.text ?? "0") ?? 0
        
        FruitCollection.addFruit(img: "placeholder", name: newName, likes: newLikes, dislikes: newDislikes)
    }
   
}
