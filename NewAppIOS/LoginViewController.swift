//
//  LoginViewController.swift
//  NewAppIOS
//
//  Created by user on 01.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0 //скрыть label

        // Do any additional setup after loading the view.
    }
  
    

    @IBAction func loginButtonPressed(_ sender: Any) {
    }
}
