//
//  firstPage.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import SwiftUI

struct firstPage: View {
    
    
    var body: some View {
        
        HStack {
            VStack{
                Image(uiImage: #imageLiteral(resourceName: "pic.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(5)
                    .padding(.leading, 8)
                Text("title")
                    .font(.headline)
                    .lineLimit(1)
            }
            Spacer()
            VStack{
                
                Image(uiImage: #imageLiteral(resourceName: "pic.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(5)
                    .padding(.leading, 8)
                
                Text("title")
                    .font(.headline)
                    .lineLimit(1)
            }
            Spacer()
            VStack{
                Image(uiImage: #imageLiteral(resourceName: "pic.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(5)
                    .padding(.leading, 8)
                Text("title")
                    .font(.headline)
                    .lineLimit(1)
            }
            Spacer()
            VStack{
                Image(uiImage: #imageLiteral(resourceName: "pic.png"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(5)
                    .padding(.leading, 8)
                Text("title")
                    .font(.headline)
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding(.vertical, 8)
        
    }
}


