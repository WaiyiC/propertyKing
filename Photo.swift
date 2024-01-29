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
    
    
    var dictionary: [String: Any]{
        return["iamgeURLString": imageURLString]
    }
}
