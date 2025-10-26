//
//  ViewController.swift
//  fruit-list
//
//  Created by open-meadow on 2025-10-25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table:UITableView!
    @IBOutlet weak var searchBar:UISearchBar!
    
    var currentFruits: [Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = FruitCollection()
        FruitCollection.unarchive()
        
        FruitCollection.load()
        
        currentFruits = FruitCollection.fruits
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FruitCollection.fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath) as! FruitCell
        cell.img.image = UIImage(named: FruitCollection.fruits[indexPath.row].img ?? "placeholder")
        cell.name.text = FruitCollection.fruits[indexPath.row].name
        cell.likes.text = String("Likes: \(FruitCollection.fruits[indexPath.row].likes)")
        cell.dislikes.text = String("Dislikes: \(FruitCollection.fruits[indexPath.row].dislikes)")
        
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
    
    // passes row number to FruitDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if triggered segue is the showFruit
        switch segue.identifier {
        case "showFruit":
                // figure out which row was just tapped
                if let row = table.indexPathForSelectedRow?.row {
                    // get fruit associated with this row and pass it along
                    let fruit = FruitCollection.fruits[row]
                    let fruitDetailViewController = segue.destination as! FruitDetailViewController
                    
                    fruitDetailViewController.fruit = fruit
                }
        case "showAddFruit":
            // without this, app crashes when creating new fruit
            break
        default:
            preconditionFailure("Unexpected segue identifier.")
            }
        }
    
    // removed implementation because it causes 'delete cell' to crash app
    @IBAction func search(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange: Int) {
        let searchBarText = searchBar.text ?? ""
        let selectedScopeButtonIndex = searchBar.selectedScopeButtonIndex
        
        switch selectedScopeButtonIndex {
        case 0:
            // All fruits
            currentFruits = FruitCollection.fruits
        case 1:
            // Liked Fruits
            currentFruits = FruitCollection.fruits.filter({
                fruit -> Bool in fruit.likes >= fruit.dislikes
            })
        case 2:
            // Disliked Fruits
            currentFruits = FruitCollection.fruits.filter({
                fruit -> Bool in fruit.likes < fruit.dislikes
            })
        default:
            break
        }
        
        
        table.reloadData()
    }
}
