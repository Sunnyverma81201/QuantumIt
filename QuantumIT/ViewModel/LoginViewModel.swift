//
//  LoginViewModel.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 26/01/23.
//

import SwiftUI
import Foundation
import Firebase
import GoogleSignIn
import FirebaseAuth


struct User {
    let uid: String
    let email: String
}

class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published private var _currentUser : User? = nil
    @Published var hasError = false
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
    
    private var handler = Auth.auth().addStateDidChangeListener{_,_ in }
    
    var currentUser: User {
        return _currentUser ?? User(uid: "", email: "")
    }
    
    init(){
        handler = Auth.auth().addStateDidChangeListener{ auth,user in
            if let user = user {
                self._currentUser = User(uid: user.uid, email: user.email!)
                self.isLoggedIn = true
            } else {
                self._currentUser = nil
                self.isLoggedIn = false
            }
        }
    }
    
    func signIn() async {
        hasError = false
        do{
            try await Auth.auth().signIn(withEmail: email, password: password)
        }catch{
            hasError = true
            errorMessage = error.localizedDescription
        }
    }

    
    func signInWithGoogle(user: GIDGoogleUser) {
        Task{
            do{
                guard let idToken = user.authentication.idToken else{return}
                let accesToken = user.authentication.accessToken
                
                let credential = OAuthProvider.credential (withProviderID: idToken, accessToken: accesToken)
                try await Auth.auth().signIn(with: credential)
                
                print("Sucess Google!")
                await MainActor.run (body: {
                    withAnimation(.easeInOut){isLoggedIn = true}
                })
            }catch{
//                await handleError(error: error)
            }
        }
    }
    
    func signOut() async {
        GIDSignIn.sharedInstance.signOut()
        
        hasError = false
        do{
            try Auth.auth().signOut()
            
        }catch{
            hasError = true
            errorMessage = error.localizedDescription
        }
        
    }
    
    deinit{
        Auth.auth().removeStateDidChangeListener(handler)
    }
}
