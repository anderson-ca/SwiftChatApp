//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        /////////////////////////////////////////////////////
        ////////////// Firebase Authentication //////////////
        /////////////////////////////////////////////////////
        
        // method that creates new user with email and password.
        // This method belong to the Firebase module(Auth). The
        // createUser method takes three arguments. Two strings
        // to represent an email, and a password. Also, a callback
        // function that will execute in the background.
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            SVProgressHUD.dismiss()
            // This if-else statement will check if there was an error
            // in the authentication process, and will provide the proper
            // reaction.
            if error != nil {
                print(error!)
            } else {
                // success.
                print("Registration successful!")
                print(user!.email!)
                // take user to chat view.
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }

    } 
    
    
}
