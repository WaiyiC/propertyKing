//
//  Profile.swift
//  propertyKing
//
//  Created by Waiyi on 23/1/2024.
//

import SwiftUI

@MainActor
final class profileViewModel : ObservableObject{
    
    func signOut() throws{
       try  AuthenticationManager.shared.signOut()
    }
}
struct Profile: View {
    
    @StateObject private var viewModel = profileViewModel()
    @Binding var showSignInView : Bool
    var body: some View {
        NavigationStack{
            List{
                Button("Log Out"){
                    Task{
                        do{
                            try viewModel.signOut()
                            showSignInView = true
                            print("success")
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle("Profile")
        }
    }
}
    
    

struct Profile_Previews : PreviewProvider{
    static var previews : some View{
        NavigationStack{
            Profile(showSignInView: .constant(false))
        }
    }
}
