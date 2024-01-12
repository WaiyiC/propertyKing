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
    @State private var wrongUname = 0
    @State private var wrongPwd = 0
    @State private var showLogin = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Username", text: $uname)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUname))
               
                SecureField("Password", text: $pwd)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPwd))
                
                SecureField("Password", text: $pwd)
                    .padding()
                    .frame(width:300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUname))
                
                Button("Register"){
                    
                }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            
        }
        .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
    }
}
