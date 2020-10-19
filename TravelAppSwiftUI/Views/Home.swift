//
//  Home.swift
//  TravelAppSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI


struct Home : View {
    
    @State var data = [

        Travel(id: 0, image: "yosemite", country: "USA", place: "Yosemite", details: "Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome. In Yosemite Village are shops, restaurants, lodging, "),
        
        Travel(id: 1, image: "antelope", country: "Arizona", place: "Antelope Canyon", details: "Antelope Canyon is a slot canyon in the American Southwest, on Navajo land east of Page, Arizona. It includes two separate, scenic slot canyon sections, referred to as Upper Antelope Canyon, and Lower Antelope Canyon."),
        
        Travel(id: 2, image: "azores", country: "Portugal", place: "Azores", details: "The Azores, an autonomous region of Portugal, are an archipelago in the mid-Atlantic. The islands are characterized by dramatic landscapes, fishing villages, green pastures and hedgerows of blue hydrangeas. São Miguel, the largest, has lake-filled calderas and the Gorreana "),
        
        Travel(id: 3, image: "venice", country: "Italy", place: "Venice", details: "Venice, the capital of northern Italy’s Veneto region, is built on more than 100 small islands in a lagoon in the Adriatic Sea. It has no roads, just canals – including the Grand Canal thoroughfare – lined with Renaissance and Gothic palaces."),
        
        Travel(id: 4, image: "angelfalls", country: "Venezuela", place: "Angel Falls", details: "Angel Falls is a waterfall in Venezuela. It is the world's highest uninterrupted waterfall, with a height of 979 metres and a plunge of 807 m. The waterfall drops over the edge of the Auyán-tepui mountain in the Canaima National Park")

    ]
    
    @State var index = 0
    
    @State var show = false
    
    var body: some View{
        
        ZStack{
            
            VStack{

                HStack{

                    Text("Travel")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    Text("\(self.index + 1)/\(self.data.count)")
                        .foregroundColor(.gray)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()

                GeometryReader{g in

                    Carousel(data: self.$data, index: self.$index, show: self.$show, size: g.frame(in: .global))
                }
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 10)
            }
            
            // hiding the view when expand view appears..
            .opacity(self.show ? 0 : 1)
            
            // Current index will give current card...
            ExpandView(data: self.$data[self.index], show: self.$show)
            //shrinking the view in background...
            .scaleEffect(self.show ? 1 : 0)
            .frame(width: self.show ? nil : 0, height: self.show ? nil : 0)
        }
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}
