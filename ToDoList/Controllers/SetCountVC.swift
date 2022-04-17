//
//  SetCountVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit
import CoreData

class SetCountVC: UIViewController {
    
    
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var task: String!
    var term: Term!
    
    var delegate : ViewOuputDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addButton.bindToKeyboard()
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func addAction(_ sender: Any) {
        self.save(completion: { (complete) in
            if complete {
                self.delegate!.closeScreen()
                dismiss(animated: true)
            }
        })
    }
    
    @IBAction func tapToSpace(_ sender: Any) {
        countTextField.endEditing(true)
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        let userTask = UserTask(context: context)
        userTask.task = task
        userTask.term = term.rawValue
        userTask.nowCount = Int32(0)
        if let count = Int(countTextField.text!) {
            userTask.resultCount = Int32(count)
        } else {
            completion(false)
            return
        }
        do {
            try context.save()
            completion(true)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
    
}
