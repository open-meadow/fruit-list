//
//  ViewController.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = FruitCollection()
        FruitCollection.unarchive()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FruitCollection.fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
        cell.name.text = FruitCollection.fruits[indexPath.row].name
        cell.likes.text = String(FruitCollection.fruits[indexPath.row].likes)
        cell.dislikes.text = String("$\(FruitCollection.fruits[indexPath.row].dislikes)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let fruit = FruitCollection.fruits[indexPath.row]
            FruitCollection.removeFruit(fruit)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        FruitCollection.moveFruit(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    @IBAction func edit(_ sender: UIButton) {
        if table.isEditing {
            sender.setTitle("Edit", for: .normal)
            sender.setImage(UIImage(systemName: "pencil"), for: .normal)
            
            table.setEditing(false, animated: true)
        } else {
            sender.setTitle( "Done", for: .normal)
            sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
            table.setEditing(true, animated: true)
        }
    }
    
    @IBAction func returnToMain(_ segue:UIStoryboardSegue) {
        table.reloadData()
    }

}

