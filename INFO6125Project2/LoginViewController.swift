//
//  LoginViewController.swift
//  INFO6125Project2
//
//  Created by Sampath Bandara on 2022-08-08.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var numberEmail:Int = 0
    var numberPassword:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordErrorLabel.isHidden = true
        emailErrorLabel.isHidden = true
        loginButton.isEnabled = false
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (email == "test" && password == "password"){
        
            //go to main screen
            performSegue(withIdentifier: "goToMain", sender: self)
        } else {
            
            loginButton.isEnabled = false
            let alert = UIAlertController(title: "Authentication", message: "Try again!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) { _ in
                self.passwordTextField.text = ""
                self.passwordErrorLabel.isHidden = false
                self.numberPassword = 0
                            }
            alert.addAction(okButton)
            self.show(alert, sender: nil)
        }
    }
    
    @IBAction func emailEditingChanged(_ sender: UITextField) {
        if(emailTextField.text == ""){
            loginButton.isEnabled = false
            emailErrorLabel.isHidden = false
            numberEmail = 0
        } else{
            emailErrorLabel.isHidden = true
            numberEmail = 1
            
            if(numberPassword==1){
                loginButton.isEnabled = true
            }
        }
    }
    
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        passwordTextField.isSecureTextEntry = true
        
        if(passwordTextField.text == ""){
            loginButton.isEnabled = false
            passwordErrorLabel.isHidden = false
            numberPassword = 0
        } else {
            passwordErrorLabel.isHidden = true
            numberPassword = 1
            if(numberEmail==1){
                loginButton.isEnabled = true
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
