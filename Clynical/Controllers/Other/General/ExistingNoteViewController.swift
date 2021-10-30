//
//  ExistingNoteViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 30/10/2021.
//

import UIKit

class ExistingNoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var notelabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        notelabel.text = note
        
    }
    
}
