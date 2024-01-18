//
//  ContentView.swift
//  propertyKing
//
//  Created by Waiyi on 10/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var uname = ""
    @State private var pwd = ""
    @State private var wrongUname = 0
    @State private var wrongPwd = 0
    @State private var showLogin = false
    @State private var showReg = false
    @State private var shoeHome = false
    
    
    var body: some View {
        
        NavigationView{
            VStack{
                Image(uiImage: #imageLiteral(resourceName: "logo.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 320)
                
                
                NavigationLink(destination: Login()){
                    Text("Login")
                }
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: register()){
                    Text("Register")
                }
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
               
            }
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
}


     
    #Preview {
        ContentView()
    }
