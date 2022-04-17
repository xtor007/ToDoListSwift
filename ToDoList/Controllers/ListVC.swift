//
//  ListVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var taskListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskListTable.delegate = self
        taskListTable.dataSource = self
    }
    
    @IBAction func addTaskAction(_ sender: Any) {
        print("add task")
    }
    
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
