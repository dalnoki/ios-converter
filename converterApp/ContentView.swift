import SwiftUI

struct ContentView: View {

    var body: some View {
        Form {
            Section("Temperature conversion") {
                TemperatureConverter()
            }
            
            
            Section("Length conversion") {
                LengthConverter()
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
