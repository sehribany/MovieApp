//
//  LoginViewController.swift
//  MoviesApp
//
//  Created by Şehriban Yıldırım on 3.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var firstswitch: UISwitch!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondSwitch: UISwitch!
    @IBOutlet weak var secondLabel: UILabel!
    
    var email: String?
    var password : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmail.text = email
        loginPassword.text = password
        
        secondview.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if loginEmail.text == email{
            if loginPassword.text == password{
                if firstswitch.isOn && secondSwitch.isOn {
                    performSegue(withIdentifier: "logintomovie", sender: nil)
                }else{
                    let alertview = UIAlertController(title: "HATA", message: "Seçenekleri onaylayınız!", preferredStyle: .alert)
                    let okbutton = UIAlertAction(title: "Okey", style: .cancel){ _ in
                        alertview.dismiss(animated: true,completion: nil)
                    }
                    alertview.addAction(okbutton)
                    present(alertview,animated: true,completion: nil)
                }
                
            }else{
                let alertview = UIAlertController(title: "HATA", message: "Şifre yanlış girilmiştir", preferredStyle: .alert)
                let okbutton = UIAlertAction(title: "Cancel", style: .cancel){ _ in
                    alertview.dismiss(animated: true,completion: nil)
                }
                let rebutton = UIAlertAction(title: "Retry", style: .default){ _ in
                    self.loginEmail.text = ""
                    self.loginPassword.text = ""
                }
                alertview.addAction(okbutton)
                alertview.addAction(rebutton)
                present(alertview,animated: true,completion: nil)
            }
        }else{
            let alertview = UIAlertController(title: "HATA", message: "E-mail yanlış girilmiştir", preferredStyle: .alert)
            let okbutton = UIAlertAction(title: "Cancel", style: .cancel){ _ in
                alertview.dismiss(animated: true,completion: nil)
            }
            let rebutton = UIAlertAction(title: "Retry", style: .default){ _ in
                self.loginEmail.text = ""
                self.loginPassword.text = ""
            }
            alertview.addAction(okbutton)
            alertview.addAction(rebutton)
            present(alertview,animated: true,completion: nil)
        }
    }
    
    
    @IBAction func firstSwitchButton(_ sender: UISwitch) {
        secondview.isHidden = false
    }
    
}


