//
//  Item.swift
//  Week10
//
//  Created by Алишер Алсейт on 15.11.2021.
//

import SwiftUI

struct Item: Decodable, Identifiable {
    
    var id = UUID()
    var image: String
    var title: String
    var subtitle: String
    var subtitle2: String
    var price: String
    
}

var items = [

    Item(image: "fridge",
         title: "N8 мкр. 25",
         subtitle: "21x Лимонад 7F 0.5",
         subtitle2: "",
         price: "4200"
        ),
    
    Item(image: "fridge",
         title: "N8 мкр. 25",
         subtitle: "0x Кола 0.5L",
         subtitle2: "0x Кола 2.0L",
         price: "0"
        ),
    
    Item(image: "fridge",
         title: "N8 мкр. 25",
         subtitle: "0x Кола 0.5L",
         subtitle2: "0x Кола 2.0L",
         price: "0"
        ),
    
    Item(image: "fridge",
         title: "N8 мкр. 25",
         subtitle: "-1x Кола 0.5L",
         subtitle2: "-1x Кола 2.0L",
         price: "-570"
        ),
    Item(image: "fridge",
         title: "N8 мкр. 25",
         subtitle: "-1x Кола 0.5L",
         subtitle2: "-1x Кола 2.0L",
         price: "-570"
        ),
    Item(image: "fridge",
         title: "N8 мкр. 25",
         subtitle: "-1x Кола 0.5L",
         subtitle2: "-1x Кола 2.0L",
         price: "-570"
        )
    
]
