//
//  Business.swift
//  Week10
//
//  Created by Алишер Алсейт on 30.11.2021.
//

import Foundation
import SwiftUI

struct Business: Decodable, Identifiable {
    

    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    
}
    
    var busineses = [
    
    
        Business(name: "7food", latitude: 43.250142, longitude: 76.851250),
        Business(name: "7food", latitude: 43.226694, longitude: 76.873677)
    ]
   

