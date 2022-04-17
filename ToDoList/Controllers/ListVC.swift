//
//  ListVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ListVC: UIViewController {

    @IBOutlet weak var taskListTable: UITableView!
    
    @IBOutlet weak var deleteConfirmationView: UIView!
    
    
    var list: [UserTask] = []
    
    var maybeDeleteIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskListTable.delegate = self
        taskListTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData()
    }
    
    @IBAction func addTaskAction(_ sender: Any) {
        let addTaskVC = self.storyboard?.instantiateViewController(withIdentifier: "addTaskVC")
        presentDetail(addTaskVC!)
    }
    
    @IBAction func notDeleteAction(_ sender: Any) {
        maybeDeleteIndex = nil
        deleteConfirmationView.isHidden = true
        updateData()
    }
    
    @IBAction func yesDeleteAction(_ sender: Any) {
        if let deleteIndex = maybeDeleteIndex {
            removeTask(index: deleteIndex)
        }
        deleteConfirmationView.isHidden = true
    }
    
    
    
    func updateData() {
        fetch(completion: { (complete) in
            if complete {
                if list.isEmpty {
                    taskListTable.isHidden = true
                } else {
                    taskListTable.isHidden = false
                    taskListTable.reloadData()
                }
            }
        })
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<UserTask>(entityName: "UserTask")
        do {
            try list = context.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
    
    func maybeRemoveTask(index: Int) {
        deleteConfirmationView.isHidden = false
        maybeDeleteIndex = index
    }
    
    func removeTask(index: Int) {
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        context.delete(list[index])
        do {
            try context.save()
            updateData()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func addOne(index: Int) {
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        let chosenTask = list[index]
        chosenTask.nowCount += 1
        do {
            try context.save()
            updateData()
        } catch {
            debugPrint(error.localizedDescription)
        }
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeDelete = UIContextualAction(style: .normal, title: "DELETE") { (action, view, success) in
            self.maybeRemoveTask(index: indexPath.row)
        }
        swipeDelete.backgroundColor = .red
        let swipeAdd = UIContextualAction(style: .normal, title: "ADD 1") { (action, view, success) in
            self.addOne(index: indexPath.row)
        }
        swipeAdd.backgroundColor = .orange
        let chosenTask = list[indexPath.row]
        var actions = [swipeDelete]
        if chosenTask.nowCount < chosenTask.resultCount {
            actions.append(swipeAdd)
        }
        let res = UISwipeActionsConfiguration(actions: actions)
        res.performsFirstActionWithFullSwipe = true
        return res
    }
    
}
