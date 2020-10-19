//
//  ExpandView.swift
//  TravelAppSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct ExpandView : View {
    
    @Binding var data : Travel
    @Binding var show : Bool
    
    var body: some View{
        
        VStack{
            
            // dismiss Button...
            
            ZStack(alignment: .topTrailing) {
                
                Image(self.data.image)
                .resizable()
                .cornerRadius(25)
                
                Button(action: {
                    
                    // dismissing the expand view...
                    
                    withAnimation{
                        
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(.trailing)
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
            }
            
            VStack(alignment: .leading, spacing: 12){
                
                Text(self.data.place)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 12){
                    
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(self.data.country)
                        .foregroundColor(.gray)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading,5)
                    
                    Text("5")
                        .foregroundColor(.gray)
                }
                
                Text(self.data.details)
            }
            .padding(.horizontal,25)
            .padding(.bottom,20)
            .foregroundColor(.black)
            .padding(.top)
            
            HStack{
                
                HStack(spacing: 15){
                    
                    Text("$ 450")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("( 3 Days )")
                        .font(.title)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("Book Now")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .padding(.vertical, 25)
                        .frame(width: UIScreen.main.bounds.width / 2.5)
                        .background(Color("Color"))
                        .clipShape(CShape())
                }
            }
        }
    }
}
