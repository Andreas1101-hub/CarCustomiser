//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Andreas Kwong on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    let stats = displayStats(makeDisplay: "Mazda", modelDisplay: "MX-5", topSpeedDisplay: "125mph", accelerationDisplay: "7.7s", handlingDisplay: "5")

    
    var body: some View {
        Text("Make: \(stats.makeDisplay)")
        Text("Model: \(stats.modelDisplay)")
        Text("Top Speed: \(stats.topSpeedDisplay)")
        Text("Acceleration (0-60): \(stats.accelerationDisplay)")
        Text("Handling: \(stats.handlingDisplay)")

    }
}

#Preview {
    ContentView()
}
