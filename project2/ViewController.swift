//
//  ViewController.swift
//  project2
//
//  Created by Reem Saleh on 26/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Title1: UITextField!
    
    @IBOutlet weak var Day: UITextField!
    
    
    @IBOutlet weak var Des: UITextField!
    
    @IBAction func onPress(_ sender: Any) {
        performSegue(withIdentifier: "saveSegue", sender: nil)
    }
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
            // Do any additional setup after loading the view.
        }
    
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


