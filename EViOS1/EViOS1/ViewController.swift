//
//  ViewController.swift
//  EViOS1
//
//  Created by Student09 on 30/06/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewOfUserIcon: UIView!
    
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var fieldLogin: UITextField!
    @IBOutlet weak var hidePasswordImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Mettre la view en cercle derrier l'image User
        viewOfUserIcon.layer.cornerRadius = 75
        
        
        //Exo2
        fieldLogin.keyboardType = .emailAddress
        fieldLogin.textContentType = .emailAddress
        
        fieldPassword.isSecureTextEntry = true
        fieldPassword.keyboardType = .default
        
        // Désactivation du clavier en cliquant dans la View
        let tapOnView = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapOnView)
        
        
    }
    
    
    
    // Observer du Button pour afficher/Cacher le Password
    @IBAction func SwitchHidePassword() {
        if fieldPassword.isSecureTextEntry {
            fieldPassword.isSecureTextEntry = false
            hidePasswordImage.image = UIImage(named: "eye_off_icon")
            
        }else{
            fieldPassword.isSecureTextEntry = true
            hidePasswordImage.image = UIImage(named: "eye_on_icon")
        }
            
        
        
    }

    
    
}

