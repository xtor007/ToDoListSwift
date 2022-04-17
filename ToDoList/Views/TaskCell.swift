//
//  TaskCell.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit
import CoreData

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var compliteView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initTask(_ task: UserTask) {
        taskLabel.text = task.task
        termLabel.text = task.term
        countLabel.text = String(task.nowCount)
        if task.resultCount <= task.nowCount {
            compliteView.isHidden = false
        } else {
            compliteView.isHidden = true
        }
    }

}
