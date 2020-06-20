//
//  View.swift
//  Colorlax
//
//  Created by Ashley Chapman on 15/06/2020.
//  Copyright © 2020 Ashley Chapman. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    public func onDropWithAvailability(of supportedTypes: [String], isTargeted: Binding<Bool>?, perform action: @escaping ([NSItemProvider]) -> Bool) -> some View {
        if #available(iOS 13.4, macCatalyst 13.4, *){
            return AnyView(self.onDrop(of: supportedTypes, isTargeted: isTargeted, perform: action))
        } else {
            return AnyView(self)
        }
    }
    
    public func onDragWithAvailability(_ data: @escaping () -> NSItemProvider) -> some View {
        if #available(iOS 13.0, macCatalyst 13.4, *){
            return AnyView(self.onDrag{ data() })
        } else {
            return AnyView(self)
        }
    }
}
