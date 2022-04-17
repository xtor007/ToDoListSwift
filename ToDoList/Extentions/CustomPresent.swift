//
//  CustomPresent.swift
//  ToDoList
//
//  Created by Anatoliy Khramchenko on 17.04.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentDetail(_ newVC: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: false)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
    }
    
    
}
