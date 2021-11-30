//
//  BusinessMap.swift
//  City Sights App
//
//  Created by Алишер Алсейт on 16.06.2021.
//

import SwiftUI
import MapKit


struct BusinessMap: UIViewRepresentable {
    
    @State var mybusineses = busineses
    @EnvironmentObject var model: ContentModel
    
    
    var locations:[MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        // Create a set of annotations from our list of businesses
        // MARK: - 1 Loop to 2 arrays
        for business in mybusineses {
            
            // if the business has a lat/long, create an MKPointAnnotation for it
            
                
                // Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: business.latitude, longitude: business.longitude)
                a.title = business.name
            
            
                
                annotations.append(a)
                
            
            
        }
        
        return annotations
        
    }
    
    
    func makeUIView(context: Context) ->  MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        
        return mapView
    }
    
  

    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        
        // Remove all annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the ones based on the business
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
        
    }
    
    // MARK: - Coordinator class
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(map: self)
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
       
        
        
    }
    
}

