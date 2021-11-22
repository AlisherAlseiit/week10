//
//  LaunchView.swift
//  Week10
//
//  Created by Алишер Алсейт on 22.11.2021.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @EnvironmentObject var model: ContentModel
    @AppStorage("stored_User") var user = "77077077777"
    
    var body: some View {
        ZStack {
            VStack(spacing:0) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(red: 0.323, green: 0.364, blue: 0.476))
                
                Rectangle()
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 10) {
                Text("Вход")
                    .foregroundColor(.white)
                
                CustomTextField(field: $model.phone, iconName: "person", isSecure: false, title: "Номер", prompt: model.phoneNumPrompt)
                
                CustomTextField(field: $model.password,iconName: "person", isSecure: false, title: "Пароль", prompt: model.phoneNumPrompt)
                
                
                HStack(spacing: 15){
                    Button {
                        model.login(phone: model.phone, password: model.password) { _ in
                            
                            model.checkLogin()
                            
                            model.password = ""
                            model.phone = ""
                        }
                    } label: {
                        Text("Отправить")
                            .foregroundColor(.white)
                    }
                    
                    
                    if getBioMetricStatus(){
                        
                        Button(action: authenticateUser, label: {
                            
                            // getting biometrictype...
                            Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color("green"))
                                .clipShape(Circle())
                        })
                    }
                }
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.gray)
                
            )
            .padding()
        }
    }
    
    func getBioMetricStatus()->Bool{
        
        let scanner = LAContext()
        if model.phone == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none){
            
            return true
        }
        
        return false
    }
    
    // authenticate User...
    
    func authenticateUser(){
        
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unlock \(model.phone)") { (status, err) in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            // setting logged status as true...
            withAnimation(.easeOut){model.loggedIn = true}
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(ContentModel())
    }
}
