//
//  TaskTableViewCell.swift
//  TaskTracker
//
//  Created by Anirudha Kumar on 09/03/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCellData(cellData: TaskDataModel?) {
        
        nameLabel.text = cellData?.name
        countLabel.text = "21"
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
    }
    

}
