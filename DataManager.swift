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
       // listener()
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
                    let time = data["time"] as? Timestamp??
                    
                    let houses = House(id: id, area: area, easte: easte, hsetype:hsetype, price: price, sell: sell,time:Timestamp())
                    self.house.append(houses)
                }
            }
        }
    }
    
    func addNew(hsetype: String,sell: String, area: String, easte: String, price: String, time:Date){
        let time = Date().formatted(.iso8601.year().month().day())
        let db = Firestore.firestore()
        let ref = db.collection("house").document(time)
        ref.setData(["hsetype": hsetype,"sell": sell, "area": area, "easte": easte, "price": price,"time":Timestamp()]) { error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
    func listener(){
        let database = Firestore.firestore()
       
        database.collection("house").addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents, error == nil else{
                
                return
            }
            
            if let snapshot = querySnapshot{
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let area = data["area"] as? String ?? ""
                    let easte = data["easte"] as? String ?? ""
                    let hsetype = data["hsetype"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let sell = data["sell"] as? String ?? ""
                    let time = data["time"] as? Date
                    
                    let houses = House(id: id, area: area, easte: easte, hsetype:hsetype, price: price, sell: sell,time:Timestamp())
                    self.house.append(houses)
                }
            }
        }
    }
    
    func deleteHouse(){
        let db = Firestore.firestore()
            db.collection("house").document().delete()
        
    }
}
