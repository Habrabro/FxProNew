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
        let httpClient = HTTPClient(baseURL: "https://api-dev.brn.ai/api/")
        let parameters = ["login": login, "password": password]
        httpClient.request("customer/login", method: .post, parameters: parameters, encoding: .JSON, responseContentType: [.applicationJSON]) { (response: LoginResponse?, error) in
            if let token = response?.token {
                print(token)
                self.showAlert(title: "Token", message: token, buttonLabel: "Close")
            }
            switch error {
            case let .custom(description):
                print(description)
                self.showAlert(title: "Error", message: description ?? "No description", buttonLabel: "Close")
            default:
                self.showAlert(title: "Error", message: error.debugDescription, buttonLabel: "Close")
            }
        }
    }
    
    private func showAlert(title: String, message: String, buttonLabel: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonLabel, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController: ValidationDelegate {
    
    func validationSuccessful() {
        login()
        loginTextField.hideInfo()
        passwordTextField.hideInfo()
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        for (field, error) in errors {
            if let field = field as? TweeAttributedTextField {
                field.showInfo(error.errorMessage, animated: true)
            }
        }
    }
    
}
