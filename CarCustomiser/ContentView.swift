//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Andreas Kwong on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var boostPackage = false
    @State private var upgradePackage = false
    @State private var remainingFunds = 1000
    
//    var exhaustPackageEnabled: Bool {
//        get {
//            return true
//        }
//    }
    @State private var exhaustPriceCheck = true
    @State private var tiresPriceCheck = true
    @State private var boostPriceCheck = true
    @State private var upgradePriceCheck = true



// Car Customiser 1
//    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
//    let stats = displayStats(makeDisplay: "Mazda", modelDisplay: "MX-5", topSpeedDisplay: "125mph", accelerationDisplay: "7.7s", handlingDisplay: "5")

    
//    var body: some View {
//        Text("Make: \(stats.makeDisplay)")
//        Text("Model: \(stats.modelDisplay)")
//        Text("Top Speed: \(stats.topSpeedDisplay)")
//        Text("Acceleration (0-60): \(stats.accelerationDisplay)")
//        Text("Handling: \(stats.handlingDisplay)")
//
//    }
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: {newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                    if remainingFunds < 500 {
                        if self.tiresPackage == true {
                            boostPriceCheck = false
                            upgradePriceCheck = false
                        }
                        if self.boostPackage == true {
                            tiresPriceCheck = false
                            upgradePriceCheck = false
                        }
                        if self.upgradePackage == true {
                            tiresPriceCheck = false
                            boostPriceCheck = false
                        }
                    }
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                    tiresPriceCheck = true
                    boostPriceCheck = true
                    upgradePriceCheck = true
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: {self.tiresPackage},
            set: {newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                    if remainingFunds < 500 {
                        if self.exhaustPackage == true {
                            boostPriceCheck = false
                            upgradePriceCheck = false
                        }
                        if self.boostPackage == true {
                            exhaustPriceCheck = false
                            upgradePriceCheck = false
                        }
                        if self.upgradePackage == true {
                            exhaustPriceCheck = false
                            boostPriceCheck = false
                        }
                    }
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                    exhaustPriceCheck = true
                    boostPriceCheck = true
                    upgradePriceCheck = true
                }
            }
        )
        
        let boostPackageBinding = Binding<Bool> (
            get: {self.boostPackage},
            set: {newValue in
                self.boostPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.5
                    remainingFunds -= 500
                    if remainingFunds < 500 {
                        if self.tiresPackage == true {
                            exhaustPriceCheck = false
                            upgradePriceCheck = false
                        }
                        if self.exhaustPackage == true {
                            tiresPriceCheck = false
                            upgradePriceCheck = false
                        }
                        if self.upgradePackage == true {
                            tiresPriceCheck = false
                            exhaustPriceCheck = false
                        }
                    }
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.5
                    remainingFunds += 500
                    tiresPriceCheck = true
                    exhaustPriceCheck = true
                    upgradePriceCheck = true
                }
            }
        )
        
        let upgradePackageBinding = Binding<Bool> (
            get: {self.upgradePackage},
            set: {newValue in
                self.upgradePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.2
                    starterCars.cars[selectedCar].handling += 1
                    starterCars.cars[selectedCar].topSpeed += 3
                    remainingFunds -= 500
                    if remainingFunds < 500 {
                        if self.tiresPackage == true {
                            boostPriceCheck = false
                            exhaustPriceCheck = false
                        }
                        if self.boostPackage == true {
                            tiresPriceCheck = false
                            exhaustPriceCheck = false
                        }
                        if self.exhaustPackage == true {
                            tiresPriceCheck = false
                            boostPriceCheck = false
                        }
                    }
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.2
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].topSpeed -= 3
                    remainingFunds += 500
                    tiresPriceCheck = true
                    boostPriceCheck = true
                    exhaustPriceCheck = true

                }
            }
        )
        
        VStack {
            Form {
                VStack (alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                    Section {
                        Toggle("Exhaust Package (500)", isOn: exhaustPackageBinding)
                            .disabled(!exhaustPriceCheck)
                        Toggle("Tires Package (500)", isOn: tiresPackageBinding)
                            .disabled(!tiresPriceCheck)
                        Toggle("Turbo Boost Package (500)", isOn: boostPackageBinding)
                            .disabled(!boostPriceCheck)
                        Toggle("General Upgrade (500)", isOn: upgradePackageBinding)
                            .disabled(!upgradePriceCheck)
                    }
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.mint)
                .baselineOffset(20)
        }
    }
    func resetDisplay() {
        self.exhaustPackage = false
        self.tiresPackage = false
        self.boostPackage = false
        self.upgradePackage = false
        remainingFunds = 1000
        exhaustPriceCheck = true
        tiresPriceCheck = true
        boostPriceCheck = true
        upgradePriceCheck = true
    }
}



#Preview {
    ContentView()
}
