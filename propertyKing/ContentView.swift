//
//  ContentView.swift
//  propertyKing
//
//  Created by Waiyi on 10/1/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSignInView = false
    @State private var showReg = false
    @State private var shoeHome = false
    
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image(uiImage: #imageLiteral(resourceName: "logo.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 320)
                
                
                NavigationLink(destination: Login(showSignInView: $showSignInView)){
                    Text("Login")
                }
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: register(showSignInView: $showSignInView)){
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
