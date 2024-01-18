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
                Map(coordinateRegion: $locationModel.coordinateRegion, showsUserLocation: true
                  )
                
            } else {
                Button("Request Permisison", action: {
                    locationModel.requestPermission()
                })
            }
            
            LocationButton {
                locationModel.requestLocation()
                  }
                  .frame(height: 44)
                  .padding()
                  
                 
            .padding()
            
        }
    }
}

struct MyLocationView_Previews : PreviewProvider {
    static var previews: some View {
        MyLocationView()
    }
}
