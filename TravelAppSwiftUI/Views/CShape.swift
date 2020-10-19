//
//  CShape.swift
//  TravelAppSwiftUI
//
//  Created by Tarokh on 10/9/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import SwiftUI

struct CShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
    
}
