//
//  MapView.swift
//  MyMap
//
//  Created by 工藤貴央 on 2021/05/03.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let searchKey:String
    let mapType:MKMapType
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        
        uiView.mapType = mapType
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchKey, completionHandler: {(placemarks,error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first,
               let location = firstPlacemark.location{
                let targetCoordinate = location.coordinate
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinate
                pin.title = searchKey
                uiView.addAnnotation(pin)
                uiView.region = MKCoordinateRegion(
                    center:targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0)
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "三鷹市役所",mapType: .standard)
    }
}
