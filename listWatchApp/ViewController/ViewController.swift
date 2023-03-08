//
//  ViewController.swift
//  listWatchApp
//
//  Created by Alperen Kavuk on 2.03.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func loginButtonVc(_ sender: Any) {
        performSegue(withIdentifier: "toLoginVc", sender: nil)
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSignupVc", sender: nil )
    }
    
func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        alert.present(alert, animated: true, completion: nil)
   }
}
