//
//  Todolist.swift
//  project2
//
//  Created by Reem Saleh on 25/03/1443 AH.
//

import UIKit

struct ToDoList {
var title: String!
var day: String!
var Descripton:   String!
}

class Todolist: UITableViewController{
    
    
    @IBOutlet var tabelview: UITableView!
    
    
    var Tasks : [ToDoList] = [
        ToDoList(title: "Healthy", day: "Sunday", Descripton: "Drink two liters of water"),
        ToDoList(title: "Have a dinner", day: "thursday", Descripton: "Have a dinner with my friend")
    ]

   
    @IBAction func deleteAll(_ sender: Any) {
        
        
        Tasks.removeAll()
        tabelview.reloadData()
        UserDefaults.standard.set(Tasks, forKey: "Lists")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ToDoListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
        
        tableView.rowHeight = 150
//      let delete = UserDefaults.standard.set(Tasks, forKey: "Lists")
//        deleteAll(<#T##sender: Any##Any#>) = delete
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellList = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)as! ToDoListCell
        cellList.title.text = Tasks[indexPath.row].title
        cellList.day.text = Tasks[indexPath.row].day
        cellList.Descripton.text = Tasks[indexPath.row].Descripton
        
        
        // Configure the cell...

        return cellList
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
