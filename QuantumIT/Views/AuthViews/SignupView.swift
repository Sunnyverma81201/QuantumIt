//
//  SignupView.swift
//  QuantumIT
//
//  Created by Apoorv Verma on 24/01/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignupView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    
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
                TextField("Email", text: $email)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(20)
                
//                Auth buttons
                VStack(spacing: 10) {

                    
    //                signup button
                            Button {
                                
                                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                    print("\(String(describing: authResult))")
                                }
                                
                            } label: {
                                Text("Sign Up")
                            }
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        
                    HStack{
                    
    //                Login with Apple Button
                        Button {
                            print("Hello")
                        } label: {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        }
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
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
                                .colorInvert()
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
