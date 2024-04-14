//
//  MapView.swift
//  prueba
//
//  Created by Jeliuska on 14/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    
    var coordinate : CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region))){
            Marker("", coordinate: coordinate)
        }
           
    }
    
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
    }
}

#Preview {
    MapView(
        coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    )
}
