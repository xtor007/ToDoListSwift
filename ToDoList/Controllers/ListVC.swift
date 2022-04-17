//
//  ListVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit
import CoreData

class ListVC: UIViewController {

    @IBOutlet weak var taskListTable: UITableView!
    
    var list: [UserTask] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let y1 = UserTask(context: context)
        y1.task = "First"
        y1.term = Term.short.rawValue
        y1.nowCount = Int32(0)
        y1.resultCount = Int32(3)
        list.append(y1)
        let y2 = UserTask(context: context)
        y2.task = "Second"
        y2.term = Term.long.rawValue
        y2.nowCount = Int32(2)
        y2.resultCount = Int32(3)
        list.append(y2)
        let y3 = UserTask(context: context)
        y3.task = "Third"
        y3.term = Term.short.rawValue
        y3.nowCount = Int32(3)
        y3.resultCount = Int32(3)
        list.append(y3)
        let y4 = UserTask(context: context)
        y4.task = "Four"
        y4.term = Term.short.rawValue
        y4.nowCount = Int32(4)
        y4.resultCount = Int32(3)
        list.append(y4)
        taskListTable.isHidden = false
        
        taskListTable.delegate = self
        taskListTable.dataSource = self
    }
    
    
    
    @IBAction func addTaskAction(_ sender: Any) {
        let addTaskVC = self.storyboard?.instantiateViewController(withIdentifier: "addTaskVC")
        presentDetail(addTaskVC!)
    }
    
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskListTable.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        cell.initTask(list[indexPath.row])
        return cell
    }

}
