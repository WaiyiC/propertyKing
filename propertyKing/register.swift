//
//  register.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import Foundation
import SwiftUI
struct register: View {
    @State private var uname = ""
    @State private var pwd = ""
    @State private var email = ""
    @State private var showAlert = false
    @State private var showPage : Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Register An Account")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Username", text: $uname)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField("Password", text: $pwd)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                SecureField("re-type Password", text: $pwd)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                
                
                Button {
                    //Code here before changing the bool value
                    
                    showAlert = true
                } label: {
                    Text("Submit")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                        .alert(isPresented:$showAlert) {
                            Alert(title: Text(""), message: Text("You have success to register."), dismissButton: .default(Text("Continue")){ 
                                self.showPage = true
                            })
                        }
                    NavigationLink("", destination: ContentView(), isActive: $showPage)
                }
                
            }
            .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            
        }
    }
}


#Preview {
    register()
}
