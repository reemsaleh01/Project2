//
//  Todolist.swift
//  project2
//
//  Created by Reem Saleh on 25/03/1443 AH.
//

import UIKit

struct Task {
var title: String!
var day: String!
var Descripton:   String!
}
class List {
    var items = [Task]()
}

class Todolist: UITableViewController, UpdateDelegate {
    func updateTask(Task: String) {
        print(Task)
        tabelview.reloadData()
    }
    
    
    
    @IBOutlet var tabelview: UITableView!
    
    
    var Tasks : List = List()
    var selectedIndex : Int!
   
    @IBAction func deleteAll(_ sender: Any) {
        
        
        Tasks.items.removeAll()
        tabelview.reloadData()
        UserDefaults.standard.set(Tasks.items, forKey: "Lists-1")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabelview.reloadData()
        print(UserDefaults.standard.array(forKey: "Lists-1") as! [Task])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Tasks.items.append(Task(title: "Healthy", day: "Sunday", Descripton: "Drink two liters of water"))
//        Tasks.items.append(Task(title: "Have a dinner", day: "thursday", Descripton: "Have a dinner with my friend"))
        Tasks.items = UserDefaults.standard.object(forKey: "Lists-1") as! [Task]
        print(UserDefaults.standard.array(forKey: "Lists-1") as! [Task])

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
        return Tasks.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellList = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)as! ToDoListCell
        cellList.title.text = Tasks.items[indexPath.row].title
        cellList.day.text = Tasks.items[indexPath.row].day
        cellList.Descripton.text = Tasks.items[indexPath.row].Descripton
        
        
        // Configure the cell...

        return cellList
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected: \(indexPath.row)")
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: self)
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
            Tasks.items.remove(at: indexPath.item)
            UserDefaults.standard.set(Tasks.items, forKey: "Lists-1")

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addSegue") {
        let addVC = segue.destination as! AddViewController
        addVC.tasks = Tasks
        } else if (segue.identifier == "editSegue") {
            let editVC = segue.destination as! EditViewController
            editVC.tasks = Tasks
            editVC.selectedIndex = selectedIndex
    }
    }
}
