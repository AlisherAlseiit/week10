//
//  ContentModel.swift
//  Week10
//
//  Created by Алишер Алсейт on 22.11.2021.
//

import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var loggedIn = false
    
    @Published var phone = ""
    @Published var password = ""
    @AppStorage("token") var token = ""
    
    func isPhoneNumberValid() -> Bool {
        
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", "^*\\d{11}$")
        
        return phoneNumberTest.evaluate(with: phone)
        
    }
    
    func isPasswordValid() -> Bool {
        // criteria in regex.  See http://regexlib.com
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^([a-zA-Z0-9@*#]{1,10})$")
        return passwordTest.evaluate(with: password)
    }
    
    var phoneNumPrompt: String {
        if isPhoneNumberValid() {
            return ""
        } else {
            return "Enter valid password"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Enter valid phone number"
        }
    }
    
    func checkLogin() {
        DispatchQueue.main.async {
            self.loggedIn = self.token == "" ? false : true
        }
      
        
        
    }
    
    func signOut() {
        
        token = ""
        
    }
    
    func login(phone: String, password: String, completion: @escaping (String) -> Void) {
        print("Performin Login")
        
        guard let url = URL(string: "https://7food.kz/api/auth/login")
        else { return }
        
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        
        do {
            // fromSwiftApp@mail.ru pass: 123123
            let params = ["phone": phone, "password": password]
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            loginRequest.setValue("application/json", forHTTPHeaderField: "content-type")
            
            URLSession.shared.dataTask(with: loginRequest) { (data, resp, err) in
                
                if let err = err {
                    print("failed to login:", err)
                    return
                }
                
               
                
                if let data = data {
                    do {
                        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            
                            let responseError = convertedJsonIntoDict["error"] as? String
                            
                            
                            
                            if responseError?.count == nil {
                                
                                DispatchQueue.main.async {
                                    let tokenAcceso = convertedJsonIntoDict["token"] as? String
                                    self.token = tokenAcceso!
                                    completion("success")
                                    print("my token = \(self.token)")
                                    
                                }
                            } else {
                                print("error")
                            }
                        }
                    }
                    catch let error as NSError {
                        print("catch let error")
                        print(error.localizedDescription)
                    }
                }
                
                
                
            }.resume()
            
        }
        catch {
            print("Failed to serilaize data:", error)
        }
        
    }
}

