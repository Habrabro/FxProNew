//
//  LoginViewController.swift
//  FxProNew
//
//  Created by admin on 22/01/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import TweeTextField
import SwiftValidator

class LoginViewController: UIViewController {
    
    // MARK: Constants
    
    let REQUIRED_FIELD_MESSAGE = "This is a required field"
    
    // MARK: Outlets
    
    @IBOutlet weak var loginTextField: TweeAttributedTextField!
    @IBOutlet weak var passwordTextField: TweeAttributedTextField!
    
    // MARK: Private properties
    
    private let validator = Validator()
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoneTap))
        self.view.addGestureRecognizer(dismissTapGesture)
        
        validator.registerField(loginTextField, rules: [
            RequiredRule(message: REQUIRED_FIELD_MESSAGE)
        ])
        validator.registerField(passwordTextField, rules: [
            RequiredRule(message: REQUIRED_FIELD_MESSAGE)
        ])
        
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: Actions
    
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        validator.validate(self)
    }
    
    // MARK: Selectors
    
    @objc private func didDoneTap() {
        view.endEditing(true)
    }
    
    // MARK: Private methods
    
    private func login() {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        let networkService = NetworkService()
        networkService.login(login: login, password: password) { response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let loginResponse = response as? LoginResponse else { return }
            guard let token = loginResponse.token else { return }
            
            let alert = UIAlertController(title: "Token", message: token, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            print("Token: " + token)
        }
    }
    
}

extension LoginViewController: ValidationDelegate {
    
    func validationSuccessful() {
        login()
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        //
    }
    
}
