//
//  ContentView.swift
//  ColorDropper
//
//  Created by Ashley Chapman on 20/06/2020.
//  Copyright © 2020 ashleychapman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Variables
    @State private var color: UIColor = UIColor.randomColor()
    @State private var isTargeted: Bool = false
    
    var body: some View {
        ZStack {
            Color(self.color)
                .onDropWithAvailability(of: ["com.apple.uikit.color"], isTargeted: self.$isTargeted, perform: {items in
                    if let item = items.first {
                        _ = item.loadObject(ofClass: UIColor.self) { color, _ in
                            if let col = color as? UIColor {
                                self.color = col
                            }
                        }
                    }
                    return true
                })
            VStack {
                Text(self.color.toHex())
                    .foregroundColor(Color(self.color.textColor(correctness: 0.3)))
                    .font(.largeTitle)
                Text("(Red: \(Int(self.color.redValue! * 255)), Green: \(Int(self.color.greenValue! * 255)), Blue: \(Int(self.color.blueValue! * 255)))")
                    .foregroundColor(Color(self.color.textColor(correctness: 0.3)))
                    .font(.headline)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
