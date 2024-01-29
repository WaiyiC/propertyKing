//
//  Login.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import Foundation
import SwiftUI

@MainActor
final class SingInWithEmail: ObservableObject{
    @Published var email = ""
    @Published var pwd = ""
    
    func register() async throws{
        guard !email.isEmpty, !pwd.isEmpty else{
            print("Email/Password not found")
            return
        }
                try await AuthenticationManager.shared.creatUser(email: email, password: pwd)
    }
    
    func signIn() async throws{
        guard !email.isEmpty, !pwd.isEmpty else{
            print("Email/Password not found")
            return
        }
                try await AuthenticationManager.shared.signInUser(email: email, password: pwd)
    }
}

struct Login: View {
    @StateObject private var viewModel = SingInWithEmail()
    @Binding var showSignInView : Bool
    @State private var loginSuccess = false
    @State private var showPage : Bool = false
    @StateObject var model = BiometricModel()
    
    var body: some View {
        NavigationView{
            if model.isAuthenicated == true {
                home()
                    .navigationTitle("")
                    .navigationBarHidden(false)
            }else{
            VStack{
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField("Password", text: $viewModel.pwd)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                HStack{
                    Button{
                        Task{
                            do{
                                try await viewModel.signIn()
                                showSignInView = false
                                return
                            }catch{
                                print(error)
                            }
                        }
                        
                    } label: {
                        Text("Login")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                    
                        Button(action: {
                            model.evaluatePolicy()
                        }, label: {
                            Image(systemName: "faceid") 
                                .resizable()
                                .foregroundColor(.green)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        })
                    
                        if model.isError == true {
                            Text("\(model.errorMessage)")
                        }
                        
                            
                    }
                }
            }
        }
    }
}
