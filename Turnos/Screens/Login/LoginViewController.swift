//
//  ViewController.swift
//  Turnos
//
//  Created by Vicente Andrés Cantú García on 9/16/18.
//  Copyright © 2018 equipo-rojo. All rights reserved.
//

import UIKit
import KeychainSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginView.layer.borderWidth = 1
        loginView.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        if email.text == "" || password.text == "" {
            present(Utils.message(message: "El correo o la contraseña no son validos"), animated: true, completion: nil)
        } else {
            KeychainSwift().set(true, forKey: "getPermission")
            let main = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            present(main!, animated: true, completion: nil)
        }
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        let alertController = UIAlertController(title: "Recuperar Contraseña", message: "Intrododuzca el correo electronico asociado a su cuenta", preferredStyle: .alert)
        
        var messageField : UITextField!
        
        let sendAction = UIAlertAction(title: "Enviar", style: .default){ action in
            // EndPoint Reset Password
        }
        
        let cancelAction = UIAlertAction(title: "Canclear", style: .destructive) { _ in }
        
        alertController.addTextField { textField in
            textField.placeholder = "Correo electrónico"
            messageField = textField
            messageField.keyboardType = .emailAddress
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(sendAction)
        
        present(alertController, animated: true)
    }
    
}

