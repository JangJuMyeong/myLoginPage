//
//  ViewController.swift
//  LoginPage
//
//  Created by 장주명 on 2021/01/02.
//

import UIKit

class FirstSignUpViewcontroller : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var imagePicker : UIImagePickerController! = UIImagePickerController()
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var IDTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkPasswordTextField: UITextField!
    @IBOutlet var nextPageBtn: UIButton!
    @IBOutlet var detailTextView: UITextView!
    
    var isEmpty = false
    var isEqaul = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        nextPageBtn.isEnabled = false
        IDTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
        detailTextView.delegate = self
        
    }
    
    
    //MARK:- custom func
    
    func initUserInformation() {
        UserInformation.shared.ID = nil
        UserInformation.shared.password = nil
        UserInformation.shared.checkPassword = nil
        UserInformation.shared.detail = nil
    }
    
    
    
    func checkTextField() {
        
        // password Check
        if passwordTextField.text == checkPasswordTextField.text {
            isEqaul = !isEqaul
        } else {
            isEqaul = false
        }
        
        // isEmty Check
        let ID = IDTextField.text?.isEmpty
        let Password = passwordTextField.text?.isEmpty
        let checkPassword = checkPasswordTextField.text?.isEmpty
        let detail = detailTextView.text?.isEmpty
        
        
        
        if let check1 = ID , let check2 = Password, let check3 = checkPassword, let check4 = detail {
            if check1 || check2 || check3 || check4 {
                isEmpty = true
            } else {
                isEmpty = false
            }
        }
        
        // isEnabled
        if !isEmpty && isEqaul  {
            nextPageBtn.isEnabled = true
        } else {
            nextPageBtn.isEnabled = false
        }
    }
    
    
    
    //MARK:- Button
    
    @IBAction func cancelBtn() {
        initUserInformation()
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func imagePick(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    //MARK:- Delegate
    
    //imagePickerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originImage
        }
        
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //TextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserInformation.shared.ID = IDTextField.text
        UserInformation.shared.password = passwordTextField.text
        UserInformation.shared.checkPassword = checkPasswordTextField.text
        checkTextField()
    }
    
    //TextViewDelegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        UserInformation.shared.detail = detailTextView.text
        checkTextField()
        if detailTextView.text.isEmpty{
            nextPageBtn.isEnabled = false
        } else {
            nextPageBtn.isEnabled = true
        }
    }
}


    
