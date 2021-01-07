//
//  SecondSignUpViewController.swift
//  LoginPage
//
//  Created by 장주명 on 2021/01/02.
//


import UIKit

class SecondSignUpViewController: UIViewController, UITextFieldDelegate{
    
    var birthday : String?
    
    var delegate : completeDelegate?
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var completeBtn: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        birthdayPicker.addTarget(self, action: #selector(changed), for: .valueChanged)
        completeBtn.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        phoneNumberTextField.text = UserInformation.shared.phoneNumber
        birthdayLabel.text = UserInformation.shared.birthday
        if let birthday = UserInformation.shared.birthday {
            birthdayPicker.date = changeDate(birthday:birthday)
        } else {
            birthdayLabel.text = dateTransString()
        }
    }
    
    func initUserInformation() {
        UserInformation.shared.birthday = nil
        UserInformation.shared.phoneNumber = nil
    }
    
    
    
    @IBAction func cancelBtn() {
        initUserInformation()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backToPage(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func completeAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "LoginPageViewcontroller") as? LoginPageViewcontroller else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        delegate?.complete()
        
    }
    
    func dateTransString() -> String {
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = .long
        
        let date = dateformatter.string(from: birthdayPicker.date)
        
        return date
    }
    
    @objc func changed() {
        
        birthdayLabel.text = dateTransString()
        UserInformation.shared.birthday = dateTransString()
    }
    
    func changeDate(birthday:String) -> Date {
        let dateString = birthday
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        
        let date: Date = dateFormatter.date(from: dateString)!
        
        return date
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let check = phoneNumberTextField.text?.isEmpty{
            if check {
                completeBtn.isEnabled = false
            } else {
                completeBtn.isEnabled = true
            }
            UserInformation.shared.phoneNumber = phoneNumberTextField.text
        }
        
    }

}
