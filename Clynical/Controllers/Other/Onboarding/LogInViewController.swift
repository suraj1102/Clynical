//
//  LogInViewController.swift
//  Clynical
//
//  Created by Suraj Dayma on 01/10/2021.
//

import UIKit


class LogInViewController: UIViewController {
    
    struct Constants {
        
        // Tab Buttons
        static let tabButtonSize: CGFloat = 22.0
        
        let boldTabButtonTextAttrs : [NSAttributedString.Key : Any] = [
            .font : UIFont.init(name: "GillSans-Semibold", size: Constants.tabButtonSize) ?? UIFont.boldSystemFont(ofSize: Constants.tabButtonSize),
            .foregroundColor : UIColor.white,
        ]
        
        let normalTabButtonTextAttrs : [NSAttributedString.Key : Any] = [
            .font : UIFont.init(name: "Gill Sans", size: Constants.tabButtonSize) ?? UIFont.systemFont(ofSize: Constants.tabButtonSize),
            .foregroundColor : UIColor.white,
        ]
        
        
        // Tab Button Constants
        let tabButtonWidthConstant: CGFloat = 0.40

        func tabButtonX(view: UIView) -> CGFloat {
            return view.width * ((1.00 - (tabButtonWidthConstant*2))/2)
        }

        func tabButtonY(view: UIView) -> CGFloat {
            return view.height * 0.05
        }
        
        func tabButtonWidth(view: UIView) -> CGFloat {
            return view.width * tabButtonWidthConstant
        }
        
        // Field Constants
        let fieldWidthConstant: CGFloat = 0.80
        static let fieldSpacing: CGFloat = 20
        static let cornerRadius: CGFloat = 5.0
        
        func fieldX(view: UIView) -> CGFloat {
            return view.width * ((1.00 - fieldWidthConstant)/2)
        }
        
        func fieldWidth(view: UIView) -> CGFloat {
            return view.width * fieldWidthConstant
        }
        
        func fieldheight(view: UIView) -> CGFloat {
            return view.height * 0.10
        }
        
    }
        
    // header view with title
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // Content view with buttons and fields
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // "CLYNICAL" text logo
    let headerTitle: UILabel = {
        let title = UILabel()
        title.attributedText = NSAttributedString.init(string: "CLYNICAL")
        title.textColor = .white
        title.textAlignment = .center
        title.contentMode = .scaleAspectFit
        title.font = UIFont.init(name: "Trebuchet MS", size: 35)
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    // Log In and Sign Up Tabs / Buttons
    let logInTab: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "Log In", attributes: Constants().boldTabButtonTextAttrs), for: .normal)
        button.sizeToFit()
        button.titleLabel?.textAlignment = .center
        return button
    }()
   
    let signUpTab: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "Sign Up", attributes: Constants().normalTabButtonTextAttrs), for: .normal)
        button.sizeToFit()
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    // Tab button underline
    let bottomLine: CALayer = {
        let line = CALayer()
        line.backgroundColor = CGColor.init(red: 200, green: 199, blue: 204, alpha: 1)
        return line
    }()
    
    // Username/Email Field
    let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username/Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1.0
        return field
    }()
    
    // Password Field
    let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .go
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderColor = UIColor.white.cgColor
        field.layer.borderWidth = 1.0
        return field
    }()
    
    // Continue log in button
    let continuelogInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        // assign frames
        headerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height * 0.15)
        
        contentView.frame = CGRect(x: 0,
                                   y: headerView.frame.height,
                                   width: view.width,
                                   height: (view.height/1.5) - headerView.height)
        
        headerTitle.frame = CGRect.init(x: 0,
                                        y: view.safeAreaInsets.top,
                                        width: view.width,
                                        height: contentView.height * 0.20)
        
        
        let tabButtonXValue = Constants().tabButtonX(view: contentView)
        let tabButtonYValue = Constants().tabButtonY(view: contentView)
        let tabButtonWidthValue = Constants().tabButtonWidth(view: contentView)
        
        logInTab.frame = CGRect.init(x: tabButtonXValue,
                                     y: tabButtonYValue,
                                     width: tabButtonWidthValue,
                                     height: contentView.height * 0.15)
        
        signUpTab.frame = CGRect.init(x: logInTab.right,
                                      y: tabButtonYValue,
                                      width:tabButtonWidthValue,
                                      height: contentView.height * 0.15)
        
        bottomLine.frame = CGRect(x: logInTab.left,
                                  y: logInTab.bottom,
                                  width: logInTab.frame.width,
                                  height: 3)
        
        
        let fieldXValue = Constants().fieldX(view: contentView)
        let fiedldWidthValue = Constants().fieldWidth(view: contentView)
        let fiedldHeightValue = Constants().fieldheight(view: contentView)
        let fieldSpacing = Constants.fieldSpacing
        
        usernameEmailField.frame = CGRect(x: fieldXValue,
                                          y: logInTab.bottom + (contentView.height * 0.10),
                                          width: fiedldWidthValue,
                                          height: fiedldHeightValue)
        
        passwordField.frame = CGRect(x: fieldXValue,
                                     y: usernameEmailField.bottom + fieldSpacing,
                                     width: fiedldWidthValue,
                                     height: fiedldHeightValue)
        
        continuelogInButton.frame = CGRect(x: fieldXValue,
                                           y: passwordField.bottom + fieldSpacing,
                                           width: fiedldWidthValue,
                                           height: fiedldHeightValue)
        
    }
    
    @objc func didTapSignUpTabButton(_ sender: UIButton){
        let signUpVc = SignUpViewController()
        signUpVc.modalTransitionStyle = .crossDissolve
        signUpVc.modalPresentationStyle = .fullScreen
        present(signUpVc, animated: true)
    }
    
    @objc func didTapContinueLogInButton(_ sender: UIButton){
        usernameEmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // email
            email = usernameEmail
        }
        else {
            // username
            username = usernameEmail
        }
        
        // Log in functionality
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    // user log in
                    let homeVC = HomeViewController()
                    homeVC.modalPresentationStyle = .fullScreen
                    self.present(homeVC, animated: true)
                }
                
                else {
                    // error
                    let alert = UIAlertController(title: "Log In Error",
                                                  message: "We were unable to log you in. Please try again.",
                                                  preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel,
                                                  handler: nil))
                    
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = UIColor.init(named: "bgGrey")
        
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        
        signUpTab.addTarget(self, action: #selector(didTapSignUpTabButton), for: .touchUpInside)
        
        continuelogInButton.addTarget(self, action: #selector(didTapContinueLogInButton), for: .touchUpInside)

    }
    
    private func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(contentView)
        
        headerView.addSubview(headerTitle)
        
        contentView.addSubview(logInTab)
        contentView.addSubview(signUpTab)
        contentView.layer.insertSublayer(bottomLine, at: 0)
        contentView.addSubview(usernameEmailField)
        contentView.addSubview(passwordField)
        contentView.addSubview(continuelogInButton)
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else {
            continuelogInButton.becomeFirstResponder()
        }
        return true
    }
}
