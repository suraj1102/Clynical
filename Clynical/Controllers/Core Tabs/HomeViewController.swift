//
//  ViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 23/09/2021.
//

import FirebaseAuth
import FirebaseDatabase
import UserNotifications
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    // save a ref to the handler
    private var authListener: AuthStateDidChangeListenerHandle?
    
    // Check for auth status some where
    override func viewWillAppear(_ animated: Bool) {
        // Check if user logged in or not, if not show startup screen
        super.viewWillAppear(animated)
        
        authListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            if user != nil {
                
            }
            else {
                // No user
                // User is signed in
                // let the user in?
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let startUpVC = storyBoard.instantiateViewController(withIdentifier: "startUpView")
                startUpVC.modalPresentationStyle = .fullScreen
                self.present(startUpVC, animated: false, completion: nil)
                
            }
        }
        // Remove the listener once it's no longer needed
        Auth.auth().removeStateDidChangeListener(authListener!)
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        welcomeLabel.text = "Welcome :)"
        
        configureNavigationBar()
        
        askNotifPermission()
    }
    
    private func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSettingsButton))
    }
    
    private func askNotifPermission() {
        // asks user for notification permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {success, error in
            if error != nil {
                return
            }
        })
    }
    
    @objc private func didTapSettingsButton() {
        let settingsVC = SettingsViewController()
        settingsVC.title = "Settings"
        settingsVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
}
