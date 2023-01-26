//
//  LoginView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 24/01/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift


struct LoginView: View {
    @ObservedObject var vm = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Image("quantum_it_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .shadow(radius: 2)
                .padding()
            
            VStack(spacing: 20){
                //                Email Login Fields
                
                TextField ("Email", text: $vm.email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding ()
                    .frame (height: 50)
                    .background (Color.black.opacity (0.05))
                    .cornerRadius(10)
                
                SecureField("Password", text: $vm.password)
                    .padding()
                    .frame (height: 50)
                    .background (Color.black.opacity (0.05))
                    .cornerRadius(10)
                
                //                Auth buttons
                VStack(spacing: 10) {
                    //                Login button
                    Button("Login") {
                        Task {
                            await vm.signIn()
                        }
                    }
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                    //                    Signup Button
                    
                    Button("Sign Up") {
                        Auth.auth().createUser(withEmail: vm.email, password: vm.password) { authResult, error in
                            print("\(String(describing: authResult))")
                        }
                    }
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                    HStack{
                        
                        //Login with Apple Button
                        // MARK: Requires Apple developer account
                       
                        
                        //                    Login with Facebook Button
                        Button {
                            print("Hello")
                        } label: {
                            Image("facebook_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
                        //                    Login with google Button
                        
                        Button {
                            print("Hello")
                        } label: {
                            Image("google_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                            
                        
                    }
                }
                .frame(width: 100)
            }
            .padding()
            Spacer()
        }
    }
}

extension UIApplication{
// Root Controller
    func rootController()->UIViewController{
        guard let window = connectedScenes.first as? UIWindowScene else{return .init()}
        guard let viewcontroller = window.windows.last?.rootViewController else{return .init()}
        
        return viewcontroller
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
