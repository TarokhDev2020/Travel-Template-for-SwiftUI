//
//  Carousel.swift
//  TravelAppSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct Carousel : UIViewRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        
        return Carousel.Coordinator(parent1: self)
    }
    
    @Binding var data : [Travel]
    @Binding var index : Int
    @Binding var show : Bool
    var size : CGRect
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let view = UIScrollView()
        // because each view takse full width so content size will be * total count...
        view.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
        
        let child = UIHostingController(rootView: HScrollView(data: self.$data, show: self.$show, size: self.size))
        child.view.backgroundColor = .clear
        // same here....
        child.view.frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        
        view.addSubview(child.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // dynamically update size when new data added...
        
        for i in 0..<uiView.subviews.count{
            
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        }
        
        uiView.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : Carousel
        
        init(parent1 : Carousel) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         
            let index = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            parent.index = index
        }
    }
}
