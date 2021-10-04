//
//  StartUpViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 04/10/2021.
//

import FirebaseAuth
import UIKit

class StartUpViewController: UIViewController {
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleNotAuthenticated()

    }
    
    private func handleNotAuthenticated() {
        // Check auth status
        if Auth.auth().currentUser != nil {
            
            // Show log in screen
            
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            present(homeVC, animated: false)
            
        }
    }
    
    
    // Creating outlets for storyboard
    @IBOutlet var authBG: UIImageView!
    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var headerImage: UIImageView!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLayoutSubviews() {
        // asign frames
    }
    
    
    @IBAction func didTapLogInButton(_ sender: Any) {
        let logInVC = LogInViewController()
        present(logInVC, animated: true)
    }
   
    @IBAction func didTapSignUpButton(_ sender: Any) {
        let SignUpVC = SignUpViewController()
        present(SignUpVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark

        // Adding backgroud
        authBG = UIImageView(frame: UIScreen.main.bounds)
        authBG.image = UIImage(named: "authBG")
        authBG.contentMode = .scaleAspectFill
        view.insertSubview(authBG, at: 0)
        
        // Corner radius for login button
        logInButton.layer.cornerRadius = 6
        
    }

}
