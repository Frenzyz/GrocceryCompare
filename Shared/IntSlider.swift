//
//  IntSlider.swift
//  GrocceryCompare
//
//  Created by Aadit Chetan on 3/25/22.
//

import SwiftUI

struct IntSlider: View {
    @State var weight1: Int = 0
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(weight1)
        }, set: {
            //rounds the double to an Int
            print($0.description)
            weight1 = Int($0)
        })
    }
    var body: some View {
        VStack{
            Text(weight1.description)
            Slider(value: intProxy , in: 0.0...1000.0, step: 1.0, onEditingChanged: {_ in
                print(weight1.description)
            })
        }
    }
}
struct IntSlider_Previews: PreviewProvider {
    static var previews: some View {
        IntSlider()
    }
}
