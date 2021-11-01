//
//  ToDoListCell.swift
//  project2
//
//  Created by Reem Saleh on 25/03/1443 AH.
//

import UIKit

class ToDoListCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var day: UILabel!
    
    @IBOutlet weak var Descripton: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    // Initialization code
        
        
    }
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
