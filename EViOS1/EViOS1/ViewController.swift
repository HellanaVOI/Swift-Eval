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
    @IBOutlet weak var switchNewslette: UISwitch!
    @IBOutlet weak var hidePasswordButton: UIButton!
    @IBOutlet weak var downloadingView: UIView!
    @IBOutlet weak var animaDownload: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Mettre la view en cercle derrier l'image User
        viewOfUserIcon.layer.cornerRadius = 75
        hidePasswordButton.imageView?.contentMode = .scaleAspectFit
        
        // Preparation nde la View Download
        downloadingView.isHidden = true
        animaDownload.startAnimating()
        
        
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
        
        fieldPassword.isSecureTextEntry.toggle()
        hidePasswordButton.setImage(
            UIImage(named: fieldPassword.isSecureTextEntry ? "eye_off_icon" : "eye_on_icon"
                   ), for: .normal)
    }
    
    
    @IBAction func tapOnLogin() {
        let fLogin = fieldLogin.text!
        let fPassword = fieldPassword.text!
        let sNews = switchNewslette.isOn
        
        
        if(fLogin.isEmpty){
            alertMessage(title: "Error", message: "Pas de login entrée")
            
        }else if(fPassword.isEmpty){
            alertMessage(title: "Error", message: "Pas de password entrée")
            
        }else if(!fLogin.contains("@")){
            alertMessage(title: "Error", message: "Ce n'est pas une adresse mail valide")
            
        }else if(fPassword.count < 4){
            alertMessage(title: "Error", message: "Password pas assez fort")
            
        }else{
            
            downloadingView.isHidden = false
            loginStart(){
                DispatchQueue.main.async {
                    self.alertMessage(
                        title: "Bievenue \(fLogin)", message: sNews ?
                        "Vous vous ete inscris à la newsletter" :
                            "Vous ne vous ete pas inscris à la newsletter"
                    )
                    self.downloadingView.isHidden = true
                }
            }
        }
        
        
    }
    
    func loginStart(completion: @escaping () -> Void ){
        DispatchQueue.global(qos: .default).async {
            sleep(3)
            completion()
        }
    }
    
    func alertMessage(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: title == "Error" ? "OK" : "Merci !",
                                      style: .default, handler: { action in print("TOUCH OK")
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

