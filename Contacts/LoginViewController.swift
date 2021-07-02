//
//  LoginViewController.swift
//  Contacts
//
//  Created by Руслан on 02.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warningLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    }
    
    @IBAction func signinButtonAction(_ sender: Any) {
        if loginTextField.text == SigninData.login && passwordTextField.text == SigninData.password {
            warningLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
            navigationController?.pushViewController(viewController, animated: true)
        } else {
            warningLabel.textColor = #colorLiteral(red: 1, green: 0.2852675915, blue: 0.3091709614, alpha: 1)
        }
    }
    
}

struct SigninData {
    static let login = "admin"
    static let password = "admin"
}

