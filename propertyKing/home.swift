//
//  home.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import SwiftUI

struct home: View {
    var body: some View {
        
        TabView {
            firstPage().tabItem({
                Image(systemName: "house")
                Text("Home")
            }).tag(2)
            
            MyLocationView().tabItem({
                Image(systemName: "location.square.fill")
                Text("My Location")
            }).tag(2)
            addHouse().tabItem({
                Image(systemName: "house.lodge.fill")
                Text("Manage")
            }).tag(2)
            Profile(showSignInView: .constant(false)).tabItem({
                Image(systemName: "person.circle")
                Text("Profile")
            }).tag(2)
            
        }
        .environmentObject(DataManager())
    }
}

#Preview {
    home()
}

