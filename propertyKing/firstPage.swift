//
//  firstPage.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import SwiftUI

struct firstPage: View {
    
    
    var body: some View {
        NavigationView{
            HStack {
                VStack{
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(5)
                        .padding(.leading, 8)
                    Text("Buy")
                        .font(.headline)
                        .lineLimit(1)
                }
                Spacer()
                VStack{
                    Image(systemName: "house")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(5)
                        .padding(.leading, 8)
                    Text("Buy")
                        .font(.headline)
                        .lineLimit(1)
                }
                Spacer()
                
                    VStack{
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(5)
                            .padding(.leading, 8)
                        Text("Buy")
                            .font(.headline)
                            .lineLimit(1)
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(5)
                            .padding(.leading, 8)
                        Text("Buy")
                            .font(.headline)
                            .lineLimit(1)
                    }
                    Spacer()
                
            }
        }
    }
}
#Preview {
    firstPage()
}


