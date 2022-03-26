//
//  GrocceryCompareApp.swift
//  Shared
//
//  Created by Aadit Chetan on 3/25/22.
//

import SwiftUI
@main
struct GrocceryCompareApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            UnitAPI()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct product {
    var price: Int
    var weight: Int
    var unit: String
    var pricePerUnit: Int

    private mutating func priceInsert(weight: Int, price: Int, unit: String) -> String {
        if (unit == "oz") {
            pricePerUnit = price / weight
        }
        return (String(pricePerUnit) + " per" + String(unit))
    };
}
