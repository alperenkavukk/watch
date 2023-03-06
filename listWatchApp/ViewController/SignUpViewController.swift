//
//  SignUpViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 2.03.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authdata, eror in
                if eror != nil {
                    self.makeAlert(titleInput: "Eror!", messageInput: eror?.localizedDescription ?? "Eror")
                }else {
                    self.performSegue(withIdentifier: "toSignTabBarVc", sender: nil)
                
            }
        }
    }
        else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    
}
    func makeAlert(titleInput:String, messageInput:String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
       }
}
