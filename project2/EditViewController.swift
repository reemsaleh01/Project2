//
//  EditViewController.swift
//  project2
//
//  Created by Reem Saleh on 27/03/1443 AH.
//

import UIKit

class EditViewController: UIViewController {
    var tasks : List!
    var selectedIndex : Int!
    @IBOutlet weak var editTextField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        print(tasks.items[selectedIndex])
        editTextField.text = tasks.items[selectedIndex].title
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateButton(_ sender: Any) {
        tasks.items[selectedIndex].title =  editTextField.text
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
