//
//  register.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import Foundation
import SwiftUI


struct register: View {
    @StateObject private var viewModel = SingInWithEmail()
    @Binding var showSignInView : Bool
    var body: some View {
        NavigationView{
            VStack{
                Text("Register An Account")
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
                
                
                Button{
                    Task{
                        do{
                            try await viewModel.register()
                            showSignInView = false
                        }catch{
                            print(error)
                        }
                    }
                    
                } label: {
                    Text("Submit")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                }
           
                
            }
            .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            
        }
    }
}


