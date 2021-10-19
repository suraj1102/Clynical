//
//  ViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 23/09/2021.
//

import FirebaseAuth
import UserNotifications
import UIKit

class HomeViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
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
            if success {
                return
            } else {
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
