//
//  TemperatureConverter.swift
//  ConverterApp
//
//  Created by Zsofia Dalnoki-Papp on 25.08.24.
//

import SwiftUI

struct TemperatureConverter: View {
    let temperatureUnitSelection = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputTemperatureUnit = "Celsius"
    @State private var outputTemperatureUnit = "Celsius"
    @State private var inputTemperatureValue: Double = 0


    var convertedTemperatureValue: Double {
        var finalAmount: Double = 0
        switch (inputTemperatureUnit, outputTemperatureUnit) {
        case ("Celsius", "Celsius"):
            finalAmount = inputTemperatureValue
        case ("Celsius", "Fahrenheit"):
            finalAmount = inputTemperatureValue * 9 / 5 + 32
        case ("Celsius", "Kelvin"):
            finalAmount = inputTemperatureValue + 273.15
        case ("Fahrenheit", "Fahrenheit"):
            finalAmount = inputTemperatureValue
        case ("Fahrenheit", "Celsius"):
            finalAmount = (inputTemperatureValue - 32) * 5 / 9
        case ("Fahrenheit", "Kelvin"):
            finalAmount = (inputTemperatureValue - 32) * 5 / 9 + 273.15
        case ("Kelvin", "Kelvin"):
            finalAmount = inputTemperatureValue
        case ("Kelvin", "Celsius"):
            finalAmount = inputTemperatureValue - 273.15
        case ("Kelvin", "Fahrenheit"):
            finalAmount = (inputTemperatureValue - 273.15) * 9 / 5 + 32
        default:
            finalAmount = 0
        }
        return finalAmount
    }
    
    
    var body: some View {
                TextField("Temperature value that you'd like to convert", value: $inputTemperatureValue, format: .number)
                    .keyboardType(.decimalPad)
            
            Section {
                Picker("Select input unit", selection: $inputTemperatureUnit) {
                    ForEach(temperatureUnitSelection, id: \.self) { unit in
                        Text(unit)
                    }
                }
                
                Picker("Select output unit", selection: $outputTemperatureUnit) {
                    ForEach(temperatureUnitSelection, id: \.self) { unit in
                        Text(unit)
                    }
                }
            }
            
            Section(header: Text("Converted temperature")) {
                Text("\(convertedTemperatureValue, specifier: "%.2f") \(outputTemperatureUnit)")
                
            }
        }
    }


#Preview {
    TemperatureConverter()
}
