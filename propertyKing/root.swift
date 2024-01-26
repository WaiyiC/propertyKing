//
//  root.swift
//  propertyKing
//
//  Created by Waiyi on 23/1/2024.
//

import SwiftUI

struct root: View {
    @State private var showSignInView : Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
                home()
            }
        }
        .onAppear(){
            let authUser = try?
            AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack{
                Login(showSignInView: $showSignInView)
            }
        }
    }
}

#Preview {
    root()
}
