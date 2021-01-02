//
//  ViewController.swift
//  LoginPage
//
//  Created by 장주명 on 2021/01/01.
//

import UIKit

class LoginPage : UIViewController {

    @IBOutlet var yagomImage: UIImageView!
    @IBOutlet var iDTextField: UITextField!
    @IBOutlet var passWordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yagomImage.image = UIImage(named: "yagom_icon")
    }
    
    @IBAction func singInBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
    }
    
}

