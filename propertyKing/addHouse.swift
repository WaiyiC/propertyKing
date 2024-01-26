//
//  addHouse.swift
//  propertyKing
//
//  Created by Waiyi on 24/1/2024.
//

import SwiftUI
import FirebaseFirestore

struct addHouse: View {
    @EnvironmentObject var dataManager : DataManager
    @State private var showPopup = false
    
    var body: some View {

        
        NavigationStack{
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
                        .navigationTitle("Manage Your House")
                        .navigationBarItems(trailing: Button(action:{
                            showPopup.toggle()
                        }, label: {
                            Image(systemName: "plus.app")
                                .font(.system(size: 30))
                        }))
                    }
                    .fullScreenCover(isPresented: $showPopup){
                        NavigationStack{
                            upload(showPopup: $showPopup)
                        }
                    }
                }
                
            }
            .scrollContentBackground(.hidden)
        }
    }
}
    
#Preview {
    addHouse()
        .environmentObject(DataManager())
}
