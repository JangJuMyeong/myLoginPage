//
//  UserInformation.swift
//  LoginPage
//
//  Created by 장주명 on 2021/01/02.
//

import Foundation

class UserInformation {
    
    static let shared : UserInformation = UserInformation()
    
    var name : String?
    var password : String?
    var checkPassword : String?
    var detail : String?
    var phoneNumber : String?
    var birthday : String?
    
    private init() {}
    
}
