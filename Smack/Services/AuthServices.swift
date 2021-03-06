//
//  AuthServices.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/9/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "email":lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER ).responseString { (response) in
            if (response.result.error == nil) {
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                self.isLoggedIn = true
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }  
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "email":lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER ).responseJSON { (response) in
            
            if (response.result.error == nil) {
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                self.isLoggedIn = true
                print("Login: User email: \(self.userEmail) Login: User token: \(self.authToken)")
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String:Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor" : avatarColor
        ]
        
        let header = [
            "Authorization": "Bearer \(self.authToken)",
            "Content-Type": "application/json"
            
        ]
        
        Alamofire.request(URL_ADD_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if (response.result.error == nil) {
                guard let data = response.data else {return}
                self.setUserInfo(data: data)
                completion(true)
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    func findUserByEmail(completion: @escaping CompletionHandler) {
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToken)"
        ]
        
        Alamofire.request(FIND_USER_BY_EMAIL + userEmail, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if (response.result.error == nil) {
                guard let data = response.data else {return}
                print("|||||||||||||||")
                print("data: \(data)")
                print("|||||||||||||||")
                print("|||||||||||||||")
                print("TOKEN: \(AuthService.instance.authToken)")
                print("|||||||||||||||")
                self.setUserInfo(data: data)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func setUserInfo(data: Data) {
        let json = JSON(data)
        print("|||||||||||||||")
        print("json: \(json)")
        print("|||||||||||||||")
        let id = json["_id"].stringValue
        let email = json["email"].stringValue
        let name = json["name"].stringValue
        let avatarName = json["avatarName"].stringValue
        let avatarColor = json["avatarColor"].stringValue
        print("|||||||||||||||")
        print("name: \(name)")
        print("|||||||||||||||")
        UserDataService.instance.setUserData(id: id, avatarColor: avatarColor, avatarName: avatarName, email: email, name: name)
    }
    
    func updateUserName(userId: String, newName: String, completion: @escaping CompletionHandler) {
        let body = [
            "name":newName
        ]
        
        let header = [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(AuthService.instance.authToken)"
        ]
        
        Alamofire.request("\(URL_PUT_NEW_NAME)\(userId)", method: .put, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}














