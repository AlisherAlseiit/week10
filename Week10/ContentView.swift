//
//  ContentView.swift
//  Week10
//
//  Created by Алишер Алсейт on 15.11.2021.
//

import SwiftUI



struct ContentView: View {
    @State var myItems = items
    var body: some View {
        NavigationView {
            
            VStack{
                Spacer()
               List {
                    Section(header: Text("01.11.2021").foregroundColor(Color.purple)) {
                        
                        NavigationLink {
                            HistoryTotal(item: myItems[0])
                        } label: {
                            HStack(spacing: 25) {
                                Image(myItems[0].image)
                                    .resizable()
                                    .frame(width: 40, height: 70)
                                
                                VStack(alignment: .leading) {
                                    Text(myItems[0].title)
                                        .fontWeight(.bold)
                                    
                                    Text(myItems[0].subtitle)
                                    
                                    Text(myItems[0].subtitle2)
                                    
                                    Text("KZT \(myItems[0].price)")
                                }
                               
                            }
                        }

                           
                        
                        
                    }
                    
                    Section(header: Text("02.09.2021").foregroundColor(Color.purple)) {
                        ForEach(myItems) { item in
                            NavigationLink {
                                
                            } label: {
                                HStack(spacing: 25) {
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 40, height: 70)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.title)
                                            .fontWeight(.bold)
                                        
                                        Text(item.subtitle)
                                        
                                        Text(item.subtitle2)
                                        
                                        Text("KZT \(item.price)")
                                    }
                                   
                                }
                            }

                            
                        }
                    }
                    
                }
                .listStyle(.automatic)
                
                
                
                
                
            }
            .navigationBarTitle("История")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Image(systemName: "chevron.left"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
