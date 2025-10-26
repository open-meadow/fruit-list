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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: "placeholder")
    }
    
    @IBAction func input(_ sender: UIButton) {
        let newName = nameTextField.text ?? ""
        
        FruitCollection.addFruit(img: "placeholder", name: newName, likes: 0, dislikes: 0)
    }
   
}
