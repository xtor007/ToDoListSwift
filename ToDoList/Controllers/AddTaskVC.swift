//
//  AddTaskVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit

protocol  ViewOuputDelegate{
    func closeScreen()
}

class AddTaskVC: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var termSegmentControl: UISegmentedControl!
    @IBOutlet weak var nextButton: UIButton!
    
    let terms = [Term.short,Term.long]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nextButton.bindToKeyboard()
        taskTextField.resignFirstResponder()
//        let titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: CGColor(red: 1, green: 1, blue: 1, alpha: 1),
//            NSAttributedString.Key.font: UIFont(name: "Papyrus", size: 20.0)!
//        ] as [NSAttributedString.Key : Any]
//        termSegmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
//        termSegmentControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
//      
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismissDetail()
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        if let task = taskTextField.text {
            if task != "" {
                let setCountVC = self.storyboard?.instantiateViewController(withIdentifier: "setCountVC") as! SetCountVC
                setCountVC.task = task
                setCountVC.term = terms[termSegmentControl.selectedSegmentIndex]
                setCountVC.delegate = self
                presentDetail(setCountVC)
            }
        }
    }
    
    @IBAction func tapToSpace(_ sender: Any) {
        taskTextField.endEditing(true)
    }
    
}

extension AddTaskVC: ViewOuputDelegate {
    
    func closeScreen() {
        dismiss(animated: false)
    }
    
}
