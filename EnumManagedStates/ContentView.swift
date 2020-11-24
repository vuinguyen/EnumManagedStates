//
//  ContentView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/15/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = AppSettings()
    
    // can we make these State variables Observed / Environment?
    // internet offline is a confusing label - double negative?
    @State var internetOffline = false 
    @State var errorLoading = false

    var body: some View {
        VStack {
            Toggle(isOn: $internetOffline, label: {
                Text("Internet Offline")
            }).padding()
            Toggle(isOn: $errorLoading, label: {
                Text("Error Loading")
            }).padding()
            
            Text("Input State:")
                .padding()
                .font(.largeTitle)
            Text("\(self.settings.state.rawValue)")
                .foregroundColor(Color.green)
                .padding()
                .font(.title)
            Button(action: {
                settings.changeState(internetOffline: internetOffline, errorLoading: errorLoading)
            }, label: {
                Text("Evaluate State")
            })
            /// Put output state display here
            
            // Label : Input state
            // Label : Output state
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
