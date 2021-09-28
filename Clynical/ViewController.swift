//
//  ViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 23/09/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var bg1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bg1 = UIImageView(frame: UIScreen.main.bounds)
        bg1.image = UIImage(named: "bg1")
        bg1.contentMode = .scaleAspectFill
        view.insertSubview(bg1, at: 0)
        
    }
}
