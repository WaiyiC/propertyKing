//
//  firstPage.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import SwiftUI
import UIKit
import CoreData
import Firebase

struct firstPage: View {
    var db: Firestore!
    @EnvironmentObject var dataManager : DataManager
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
                        
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitle("Find Your Dream House")
        }
        
    }
    private func orderAndLimitDesc() {
        let house = db.collection("house")

        // [START order_and_limit_desc]
        house.order(by: "time", descending: true).limit(to: 3)
        // [END order_and_limit_desc]
      }

}


#Preview {
    firstPage()
        .environmentObject(DataManager())
}


