//
//  HistoryTotal.swift
//  Week10
//
//  Created by Алишер Алсейт on 15.11.2021.
//

import SwiftUI

struct HistoryTotal: View {
    var item: Item = items[0]
    var body: some View {
        
        VStack(spacing: 10) {
            
            ZStack {
                Rectangle()
                    .frame(height: 25)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray, radius: 7, x: 0, y: 0)
                
                HStack(spacing: 25) {
                    Text("01-11-2021")
                        
                    
                    Text("10:44")
                        
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray, radius: 7, x: 0, y: 0)
                
                HStack {
                    Text("Номер Покупки")
                        
                    Spacer()
                    Text("10918")
                        
                }
                .padding()
            }
            
            ZStack {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .shadow(color: Color.gray, radius: 7, x: 0, y: 0)
                
                HStack {
                    Text("Местоположение")
                        
                    Spacer()
                    Text(item.title)
                        
                }
                .padding()
            }
            
            ZStack {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.blue)
                
                HStack {
                    Text("Итоговая цена")
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(item.price) T")
                        .foregroundColor(.white)
                }
                .padding()
            }
            
//            ZStack {
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(height: 250)
//                    .cornerRadius(10)
//                    .shadow(color: Color.gray, radius: 7, x: 0, y: 0)
//
                
                HStack(spacing: 0) {
                    Image("cola")
                        .resizable()
                        .frame(width: 100, height: 150)
                    
                    VStack {
                        ZStack {
                        Rectangle()
                            .foregroundColor(Color("Color1"))
                            .frame(width: 250, height: 50)
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Название")
                                
                                Text("\(item.subtitle)")
                            }
                            
                        }
                        
                        ZStack {
                        Rectangle()
                            .foregroundColor(Color("Color1"))
                            .frame(width: 250, height: 50)
                            .cornerRadius(10)
                            
                            HStack(spacing: 100) {
                                Text("Количество")
                                    
                                
                                Text("21 шт")
                            }
                            
                        }
                        
                        ZStack {
                        Rectangle()
                            .foregroundColor(Color("Color1"))
                            .frame(width: 250, height: 50)
                            .cornerRadius(10)
                            
                            HStack(spacing: 140) {
                                Text("цена")
                                    
                                
                                Text("200 тг")
                            }
                            
                        }
                        
                        ZStack {
                        Rectangle()
                            .foregroundColor(Color("Color1"))
                            .frame(width: 250, height: 50)
                            .cornerRadius(10)
                            
                            HStack(spacing: 120) {
                                Text("Сумма")
                                    
                                
                                Text("4200 тг")
                            }
                            
                        }
                    }
                    

                
            }
                .padding(15)
                .background(Color(.white).shadow(color: Color.gray, radius: 7, x: 0, y: 0))
                .cornerRadius(10)
            .padding()
            
            
           
            Spacer()
        }
        
       
        
        
        
    }
}

struct HistoryTotal_Previews: PreviewProvider {
    static var previews: some View {
        HistoryTotal()
    }
}
