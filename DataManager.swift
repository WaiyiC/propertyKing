//
//  DataManager.swift
//  propertyKing
//
//  Created by Waiyi on 24/1/2024.
//

import Foundation
import Firebase
import FirebaseFirestore

class DataManager : ObservableObject{
    @Published var house = [House]()
    
    init(){
        fetchHouse()
    }
    
    func fetchHouse(){
        house.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("house")
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot{
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let area = data["area"] as? String ?? ""
                    let easte = data["easte"] as? String ?? ""
                    let hsetype = data["hsetype"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let sell = data["sell"] as? String ?? ""
                    let time = data["time"] as? Date
                    
                    let houses = House(id: id, area: area, easte: easte, hsetype:hsetype, price: price, sell: sell,time:Date())
                    self.house.append(houses)
                }
            }
        }
    }
    
    func addNew(hsetype: String,sell: String, area: String, easte: String, price: String, time:Date){
        let db = Firestore.firestore()
        let ref = db.collection("house").document()
        ref.setData(["hsetype": hsetype,"sell": sell, "area": area, "easte": easte, "price": price,"time":Date()]) { error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
}
