//
//  MyLocationView.swift
//  propertyKing
//
//  Created by Waiyi on 11/1/2024.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit
import CoreLocationUI

struct MyLocationView : View {
    
    @StateObject var locationModel = LocationModel()
    @State var coordinateRegion : MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                                                                          span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        VStack {
            if locationModel.authorizationStatus == .authorizedWhenInUse ||
                locationModel.authorizationStatus == .authorizedAlways {
                Map(initialPosition: .region(coordinateRegion)){
                    Marker("Ravana Garden", coordinate: .RavanaGarden)
                    Marker("Pictorial Garden", coordinate: .PictorialGarden)
                }
                .tint(.green)
                .mapControls {
                    MapUserLocationButton()
                }
                
            } else {
                Button("Request Permisison", action: {
                    locationModel.requestPermission()
                })
            }
        }
        
    }
}

extension CLLocationCoordinate2D {
    static let RavanaGarden = CLLocationCoordinate2D(latitude: 22.39129184745116, longitude:  114.20494235148799)
    static let PictorialGarden = CLLocationCoordinate2D(latitude: 22.394555464118312,  longitude: 114.20777476396911)
}
struct MyLocationView_Previews : PreviewProvider {
    static var previews: some View {
        MyLocationView()
    }
}
