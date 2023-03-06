//
//  LoginViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 2.03.2023.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {


    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtnClicked(_ sender: Any) {
      
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata , eror in
                if eror != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: eror?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toTabbarvc", sender: nil)
                }
            }
    }
        else {
            self.makeAlert(titleInput: "EROR", messageInput: "USERNAME/PASSWORD NOT FOUND")
        }
    
       

}
    func makeAlert(titleInput:String, messageInput:String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            alert.present(alert, animated: true, completion: nil)
       }
}
  

