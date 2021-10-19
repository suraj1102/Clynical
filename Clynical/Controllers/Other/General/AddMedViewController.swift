//
//  AddMedViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 01/10/2021.
//

import UIKit

class AddMedViewController: UIViewController {

    // UI components needed for notifications
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField! // description
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapSave() {
        // Validate user inputs and save med
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty {
            let endDate = datePicker.date
            print(endDate)
        }
           
    }
}
