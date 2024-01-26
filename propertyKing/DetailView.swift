//
//  DetailView.swift
//  propertyKing
//
//  Created by Waiyi on 26/1/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var dataManager : DataManager
    
    var body: some View {
        List{
            Section() {
                ForEach(dataManager.house, id: \.time) {house in
                    HStack{
                        Rectangle()
                            .strokeBorder()
                            .foregroundColor(.green.opacity(0.9))
                            .frame(width: 150, height: 150)
                        VStack{
                            Text((house.time).formatted(date:.numeric,time:.standard))
                            HStack{
                                
                                //Text("\(house.time)")
                                Text(house.sell)
                                Text(house.hsetype)
                            }
                            .font(.headline)
                            HStack{
                                Text(house.area)
                            }
                            HStack{
                                Text(house.easte)
                            }
                            HStack{
                                Text("$"+house.price)
                            }
                        }.frame(height: 100)
                    }
                    .navigationTitle("Find Your Dream House")
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}
#Preview {
    DetailView()
}
