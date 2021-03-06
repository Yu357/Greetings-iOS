//
//  ContentView.swift
//  Greetings
//
//  Created by Yu on 2022/05/06.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var signInStateViewModel = SignInStateViewModel()
    
    var body: some View {
        
        if !signInStateViewModel.isLoaded {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        
        if signInStateViewModel.isLoaded && !signInStateViewModel.isSignedIn {
            WelcomeView()
        }
        
        if signInStateViewModel.isLoaded && signInStateViewModel.isSignedIn {
            TabView {
                FirstView()
                    .tabItem {
                        Label("home", systemImage: "house")
                    }
                SecondView()
                    .tabItem {
                        Label("search", systemImage: "magnifyingglass")
                    }
                ThirdView()
                    .tabItem {
                        Label("notifications", systemImage: "bell")
                    }
            }
        }
    }
}
