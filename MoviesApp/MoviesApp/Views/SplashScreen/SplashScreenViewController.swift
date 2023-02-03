//
//  SplashScreenViewController.swift
//  MoviesApp
//
//  Created by Şehriban Yıldırım on 3.02.2023.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var iamageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let nextVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController")
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
