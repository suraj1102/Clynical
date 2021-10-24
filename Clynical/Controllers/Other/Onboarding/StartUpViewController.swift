//
//  StartUpViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 04/10/2021.
//

import FirebaseAuth
import UIKit

class StartUpViewController: UIViewController {
    
    // Adding Views
    private let topView: UIView = {
        let topView = UIView()
        topView.clipsToBounds = true
        topView.backgroundColor = .black
        
        return topView
    }()
    
    private let bottomView: UIView = {
        let bottomView = UIView()
        bottomView.clipsToBounds = true
        bottomView.backgroundColor = UIColor.init(named: "bgGrey")
        return bottomView
    }()
    
    override func viewDidLayoutSubviews() {
        // assign frames
        topView.frame = CGRect(x: 0,
                               y: 0,
                               width: view.width,
                               height: view.height/2)
        
        bottomView.frame = CGRect(x: 0,
                                  y: view.height/2,
                                  width: view.width,
                                  height: view.height/2)
        
        configureTopView()
        configureBottomView()
    }
    
    private func configureTopView() {
    
        // Add app logo
        let headerTitle = UILabel()
        topView.addSubview(headerTitle)
        headerTitle.attributedText = NSAttributedString.init(string: "CLYNICAL")
        headerTitle.textColor = .white
        headerTitle.textAlignment = .center
        headerTitle.contentMode = .scaleAspectFit
        headerTitle.font = UIFont.init(name: "Trebuchet MS", size: 35)
        headerTitle.adjustsFontSizeToFitWidth = true
        
        headerTitle.frame = CGRect.init(x: 0, y: view.safeAreaInsets.top, width: view.width, height: topView.height * 0.20)
        
        // Add headerImage
        let headerImage = UIImageView(image: UIImage(named: "moneyBrain"))
        topView.addSubview(headerImage)
        headerImage.contentMode = .scaleAspectFit
        headerImage.frame = CGRect.init(x: -8, y: view.frame.minY + (topView.height * 0.20), width: view.width, height: topView.height * 0.80)
        
    }
    
    private func configureBottomView() {
        
        // "Already have an account?" Label
        let haveAccountLabel = UILabel()
        bottomView.addSubview(haveAccountLabel)
        haveAccountLabel.text = "Already have an account?"
        haveAccountLabel.textAlignment = .center
        haveAccountLabel.textColor = .white
        haveAccountLabel.font = .systemFont(ofSize: 17)
        haveAccountLabel.frame = CGRect(x: 0, y: 10, width: bottomView.width, height: bottomView.height * 0.10)
        
        // Log in button
        let logInButton = UIButton()
        bottomView.addSubview(logInButton)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.center = bottomView.center
        logInButton.backgroundColor = UIColor.init(named: "logInButtonBG")
        logInButton.layer.cornerRadius = 7.0
        
        logInButton.frame = CGRect(x: bottomView.width * 0.20, y: 5 + (bottomView.height * 0.10), width: bottomView.width * 0.60, height: bottomView.height * 0.08)
                
        logInButton.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)

   
        // Sign up button
        let signUpButton = UIButton()
        bottomView.addSubview(signUpButton)
        
            // Adding "Don't have an account?" Label in the button
        let labelAttrs : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17.0),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        let labelStr = NSMutableAttributedString(string:"Don't have an account? ", attributes:labelAttrs)
        
            // Adding "Sign Up." text which is also underlined
        let buttonAttrs : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17.0),
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue
        ]
        
        let buttonTitleStr = NSMutableAttributedString(string:"Sign Up.", attributes:buttonAttrs)
        
            // Concantanating the two strings
        let buttonStr = NSMutableAttributedString()
        buttonStr.append(labelStr)
        buttonStr.append(buttonTitleStr)
        
        signUpButton.setAttributedTitle(buttonStr, for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.contentHorizontalAlignment = .center
        signUpButton.frame = CGRect(x: 0, y: (bottomView.height * 0.20) - 5, width: bottomView.width, height: bottomView.height * 0.10)
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
    }
    
    @objc func didTapLogInButton(_ sender: UIButton) {
        let logInVC = LogInViewController()
        logInVC.modalPresentationStyle = .fullScreen
        present(logInVC, animated: true)
    }
    
    @objc func didTapSignUpButton(_ sender: UIButton) {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .red
        addSubviews()
    }

    private func addSubviews() {
        view.addSubview(topView)
        view.addSubview(bottomView)
    }

}
