//
//  RegisterViewController.swift
//  MoviesApp
//
//  Created by Şehriban Yıldırım on 3.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerName: UITextField!
    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    @IBOutlet weak var registerRePassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        textContol(textFieldArray: [registerName])
        passwordControl(textPasswordArray: [registerPassword,registerRePassword])
        emailControl(textEmailArray: [registerEmail])
        
        if registerName.text?.isEmpty != true && registerPassword.text?.isEmpty != true && registerEmail.text?.isEmpty != true && registerRePassword.text?.isEmpty != true {
            performSegue(withIdentifier: "registertologin", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let email = registerEmail.text
        let password = registerPassword.text
        if segue.identifier == "registertologin"{
            let vc = segue.destination as! LoginViewController
            vc.email = email
            vc.password = password
        }
    }
    
    func textContol(textFieldArray: [UITextField]) {
        for textField in textFieldArray {
            if textField.text?.isEmpty == true{
                textField.backgroundColor = .systemRed
                textField.placeholder = "Bu alan boş bırakılamaz."
            }
            else{
                if textField.text!.count < 3 {
                    textField.text = ""
                    textField.backgroundColor = .systemRed
                    textField.placeholder = "En az 3 karakter olabilir."
                }else{
                    textField.backgroundColor = .white
                }
            }
        }
    }
    
    func passwordControl(textPasswordArray: [UITextField]){
        for textField in textPasswordArray {
            if textPasswordArray[0].text == textPasswordArray[1].text{
                if ((textPasswordArray[0].text!.count > 8 && textPasswordArray[1].text!.count > 8) || ( textPasswordArray[0].text!.count < 5 && textPasswordArray[1].text!.count < 5 )) {
                    textPasswordArray[0].backgroundColor = .systemRed
                    textPasswordArray[0].text = ""
                    textPasswordArray[0].placeholder = "Şifre en az 5 en çok 8 karakter olmalı."
                    textPasswordArray[1].backgroundColor = .systemRed
                    textPasswordArray[1].text = ""
                    textPasswordArray[1].placeholder = "Şifre en az 5 en çok 8 karakter olmalı."
                }else{
                    textPasswordArray[0].backgroundColor = .white
                    textPasswordArray[1].backgroundColor = .white
                }
            }else{
                textField.backgroundColor = .systemRed
                textField.text = ""
                textField.placeholder = "Şifreler eşit değil."
            }
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func emailControl(textEmailArray :[UITextField]){
        for textField in textEmailArray {
            if let text = textField.text, isValidEmail(email: text) {
                textField.backgroundColor = .white
            } else {
                textField.backgroundColor = .systemRed
                textField.text = ""
                textField.placeholder = "Geçerli bir e-posta adresi değil."
            }
        }
    }
    
}

