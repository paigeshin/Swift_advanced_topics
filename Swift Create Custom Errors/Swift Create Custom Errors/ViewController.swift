//
//  ViewController.swift
//  Swift Create Custom Errors
//
//  Created by shin seunghyun on 2020/08/13.
//  Copyright © 2020 paige sofrtware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        do {
            try login()
        } catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email Form", message: "Please validate your email", vc: self)
        } catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password is too short!", message: "should be more than 8 characters", vc: self)
        } catch {
            Alert.showBasic(title: "Unknown Error", message: "", vc: self)
        }
        
    }
    
    /****  throws, throw  ****/
    //create custom error
    func login() throws {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        
        
        
    }
    
}

