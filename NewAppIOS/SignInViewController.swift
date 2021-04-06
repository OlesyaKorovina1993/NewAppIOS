//
//  SigninViewController.swift
//  NewAppIOS
//
//  Created by user on 01.04.2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0 //скрыть label

        // Do any additional setup after loading the view.
    }

    //проверка
    func checkValid() -> String? {
        if firstNameTextField.text == "" ||
           lastNameTextField.text == "" ||
           emailTextField.text == "" ||
           passwordTextField.text == "" ||
           firstNameTextField.text == nil ||
           lastNameTextField.text == nil ||
           emailTextField.text == nil ||
           passwordTextField.text == nil {
            
            return("Please, fill in all fiels")
        }
           
         return nil //нет никаких ошибок
           
    }
    
    
        @IBAction func signInButtonPressed(_ sender: Any) {
        
        //проверка, есть ли значение в checkValid
        let error = checkValid()
        if error != nil {
            errorLabel.alpha = 1
            errorLabel.text = error
        }else{
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {(result, error) in
                if error != nil {
                    //print("init 1")
                    self.errorLabel.text! = "\(error!.localizedDescription)"
                } else {
                    //print(self.firstNameTextField.text!)
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "name":self.firstNameTextField.text!,
                        "surname":self.lastNameTextField.text!,
                        //"email":self.emailTextField.text!,
                        //"password":self.passwordTextField.text!,
                        "uid": result!.user.uid
                    
                    
                    ]) { (error) in
                        if error != nil {
                            print(error!)
                            self.errorLabel.text = "Error saving user in database"
                        }
                        print(result!.user.uid)
                       
                    }
                    
                    //print("Jump to the next screen")
                }
                
            } //!принудительное извлечение/ можно делать так как выше была проверка
            
            }
            
        }
    
    }
        

    


