//
//  LengthConverter.swift
//  ConverterApp
//
//  Created by Zsofia Dalnoki-Papp on 25.08.24.
//

import SwiftUI

struct LengthConverter: View {
    @State public var inputUnit = "meter"
    @State public var outputUnit = "meter"
    @State public var inputLenghtValue : Double = 0
    
    let lengthUnits = ["milimeter", "centimeter", "meter", "kilometer"]

    var convertedLengthValue: Double {
        let conversionFactorsToMillimeters: [String: Double] = [
            "meter": 1000,
            "centimeter": 10,
            "kilometer": 1000000,
            "milimeter": 1
        ]
        
        guard let inputFactor = conversionFactorsToMillimeters[inputUnit],
              let outputFactor = conversionFactorsToMillimeters[outputUnit] else {
            return 0
        }
        
        let inputValueInMillimeters = inputLenghtValue * inputFactor
        return inputValueInMillimeters / outputFactor
    }
    
    
    
    var body: some View {
        Section {
            HStack {
                Text("Enter input value:")
                TextField("Length value that you'd like to convert", value: $inputLenghtValue, format: .number)
                    .keyboardType(.decimalPad)
            }
                
            Section {
                VStack {
                    Text("Input unit:")
                    Picker("", selection: $inputUnit) {
                        ForEach(lengthUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
            }
            
            }
            Section {
                VStack {
                    Text("Output unit:")
                    Picker("", selection: $outputUnit) {
                        ForEach(lengthUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
            }

            .pickerStyle(.segmented)
            .padding()
        }
        
        Section {
            HStack {
                Text("Converted value")
                Text("\(convertedLengthValue, specifier: "%.2f") \(outputUnit)")
            }
            
        }
        }
}

#Preview {
    LengthConverter()
}
