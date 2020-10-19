//
//  HScrollView.swift
//  TravelAppSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct HScrollView : View {
    
    @Binding var data : [Travel]
    // for expanding view...
    @Binding var show : Bool
    var size : CGRect
    
    var body: some View{
        
        HStack(spacing: 0){
            
            ForEach(self.data){i in
                
                ZStack(alignment: .bottom){
                    
                    Image(i.image)
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: self.size.width - 30, height: self.size.height)
                        .cornerRadius(25)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            
                            withAnimation{
                                self.show.toggle()
                            }
                    }
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(i.place)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 25, weight: .bold))
                            
                            Text(i.country)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.leading,5)
                            
                            Text("5")
                        }
                        
                        Text(i.details)
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom,20)
                    .foregroundColor(.white)
                }
                .frame(width: self.size.width, height: self.size.height)
            }
        }
    }
}


