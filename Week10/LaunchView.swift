//
//  LaunchView.swift
//  Week10
//
//  Created by Алишер Алсейт on 22.11.2021.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        
        if !model.loggedIn {
            LoginView()
                .onAppear {
                    
                    // Check if the user logged in or out
                    model.checkLogin()
                }
        } else {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "rectangle")
                    }
                ProfileView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }
            }
               
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
