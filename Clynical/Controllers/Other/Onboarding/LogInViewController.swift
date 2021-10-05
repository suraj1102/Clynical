//
//  LogInViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 01/10/2021.
//

import UIKit


class LogInViewController: UIViewController {
    
    @IBOutlet var authBG2: UIImageView!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var usernameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        
        authBG2 = UIImageView(frame: UIScreen.main.bounds)
        authBG2.image = UIImage(named: "authBG2_alt")
        authBG2.contentMode = .scaleAspectFill
        view.insertSubview(authBG2, at: 0)
        
        usernameField.layer.borderColor = UIColor.white.cgColor
        usernameField.layer.borderWidth = 1
    }
    
}
