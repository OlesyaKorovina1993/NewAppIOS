//
//  LoginViewController.swift
//  NewAppIOS
//
//  Created by user on 01.04.2021.
//

import UIKit
import FirebaseAuth
import Firebase

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
    func checkValidLog() -> String {
        if emailTextField.text == ""
            || passwordTextField.text == ""
            || emailTextField.text == nil
            || passwordTextField.text == nil {
            
            return("Please, fill in all fields")
        }
        return("")
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
        let error = checkValidLog()
        print(error)
        //print("123" + self.emailTextField.text!)
        //print(self.passwordTextField.text!)
        if error != "" {
            errorLabel.alpha = 1
            errorLabel.text = error
        } else {
            
            
            
            //let viewController = storyboard?.instantiateViewController(withIdentifier: "MainMenu") as! UIViewController
            //self.present(viewController, animated: true)
            
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil{
                    self.errorLabel.text! = "\(error!.localizedDescription)"
                    
                        print("Some sign in error")
                    
                }else{
                    if let pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageVC") as? PageViewController {
                        pageViewController.modalTransitionStyle = .crossDissolve // это значение можно менять для разных видов анимации появления
                        pageViewController.modalPresentationStyle = .overCurrentContext // это та самая волшебная строка, убрав или закомментировав ее, вы получите появление смахиваемого контроллера
                        self.present(pageViewController, animated: true, completion: nil)
                       }
                    
                    print("Jump to the next screen")
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("init")
        let error = checkValidLog()
        print(error)
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

