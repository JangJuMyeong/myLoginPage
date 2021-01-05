//
//  ViewController.swift
//  LoginPage
//
//  Created by 장주명 on 2021/01/01.
//

import UIKit

class LoginPageViewcontroller: UIViewController {

    @IBOutlet var yagomImage: UIImageView!
    @IBOutlet var iDTextField: UITextField!
    @IBOutlet var passWordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yagomImage.image = UIImage(named: "yagom_icon")
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "FirstSignUpViewcontroller") as? FirstSignUpViewcontroller else { return }
        self.present(vc, animated: true)
    }
    
}

