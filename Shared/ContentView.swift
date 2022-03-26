//
//  ContentView.swift
//  Shared
//
//  Created by Aadit Chetan on 3/25/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var selectedUnitIndex = 1
    @State var weight1: Int = 1
    @State var weight2: Int = 1
    @State var price1String = ""
    @State var price2String = ""
    @State var pricePerUnit1 = 0
    @State var pricePerUnit2 = 0
    @State var unit1 = ""
    @State var unit2 = ""
    var body: some View {
        NavigationView {
            VStack {
                GroupBox("Product #1") {
                    Form {
                        Section(header: Text("WEIGHT")){
                            Picker(selection: $selectedUnitIndex, label: Text("Units")) {
                                Text("Oz - Ounces").tag(1)
                                Text("lb - Pounds").tag(2)
                                Text("g - Grams").tag(3)
                            }
                            IntSlider()
                        }
                        Section(header: Text("PRICE")){
                            TextField("Product Price", text: $price1String).keyboardType(.numberPad)
                        }
                    }
                }
                GroupBox("Product #2") {
                    Form {
                        Section(header: Text("WEIGHT")){
                            Picker(selection: $selectedUnitIndex, label: Text("Units")) {
                                Text("Oz - Ounces").tag(1)
                                Text("lb - Pounds").tag(2)
                                Text("g - Grams").tag(3)
                            }
                            IntSlider()
                        }
                        Section(header: Text("PRICE")){
                            TextField("Product Price", text: $price2String).keyboardType(.numberPad)
                        }
                    }
                }
                Button("CONVERT") {
                    convertUnits(weight1: weight1, weight2: weight2, price1String: price1String, price2String: price2String, unit1: unit1, unit2: unit2, pricePerUnit1: pricePerUnit1, pricePerUnit2: pricePerUnit2)
                    print(pricePerUnit1)
//                    print(pricePerUnit2)
                }
            }.navigationBarTitle(Text("Grocery Converter"))
        }
    }
    func convertUnits(weight1: Int, weight2: Int, price1String: String, price2String: String, unit1: String, unit2: String, pricePerUnit1: Int, pricePerUnit2: Int) -> Int {
        let price1 = Int(price1String) ?? 0
        let price2 = Int(price2String) ?? 0
        let pricePerUnit1 = price1 / weight1
//    let pricePerUnit2 = price2 / weight2
        return pricePerUnit1;
//        return pricePerUnit2;
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
