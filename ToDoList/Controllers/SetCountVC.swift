//
//  SetCountVC.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import UIKit

class SetCountVC: UIViewController {
    
    
    @IBOutlet weak var countTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var task: String!
    var term: Term!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addButton.bindToKeyboard()
        print("\(task) is \(term.rawValue)")
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func addAction(_ sender: Any) {
        print("add")
    }
    
    @IBAction func tapToSpace(_ sender: Any) {
        countTextField.endEditing(true)
    }
    
}
