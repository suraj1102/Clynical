//
//  AddMedViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 01/10/2021.
//

import UIKit

class AddMedViewController: UIViewController, UITextFieldDelegate {

    // UI components needed for notifications
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField! // description
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        titleField.delegate = self
        bodyField.delegate = self
        
    }
    
    @objc func didTapSave() {
        // Validate user inputs and save med
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty {
            let targetDate = datePicker.date

            completion?(titleText, bodyText, targetDate)
        }
           
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
