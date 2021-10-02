//
//  LogInViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 01/10/2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var authBG: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authBG = UIImageView(frame: UIScreen.main.bounds)
        authBG.image = UIImage(named: "authBG")
        authBG.contentMode = .scaleAspectFill
        view.insertSubview(authBG, at: 0)

    }
    
}
