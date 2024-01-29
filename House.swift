//
//  House.swift
//  propertyKing
//
//  Created by Waiyi on 24/1/2024.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseFirestore

struct House: Codable, Identifiable {
    var id: String
    var area:String
    var easte:String
    var hsetype:String
    var price :String
    var sell:String
    @ServerTimestamp var time: Timestamp?
    }

