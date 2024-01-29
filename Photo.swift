//
//  Photo.swift
//  propertyKing
//
//  Created by Waiyi on 29/1/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Photo: Identifiable, Codable{
    @DocumentID var id : String?
    var imageURLString = ""
    var desc = ""
    var reviewer = Auth.auth().currentUser?.email ?? ""
    var postedOn = Date()
    
    var dictionary: [String: Any]{
        return["iamgeURLString": imageURLString, "desc": desc,  "reviewer": reviewer, "postedOn": Timestamp(date:Date())]
    }
}
