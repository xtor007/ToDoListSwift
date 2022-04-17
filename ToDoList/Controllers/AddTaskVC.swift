//
//  AddTaskVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit

class AddTaskVC: UIViewController {
    
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var termSegmentControl: UISegmentedControl!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        print("next")
    }
    
}
