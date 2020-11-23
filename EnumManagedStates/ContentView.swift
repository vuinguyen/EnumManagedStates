//
//  ContentView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/15/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var settings = AppSettings()
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
            Button(action: {
                settings.changeState(internetOffline: internetOffline, errorLoading: errorLoading)
            }, label: {
                Text("Next Step")
            })
            Text("State:")
                .padding()
                .font(.largeTitle)
            Text("\(self.settings.state.rawValue)")
                .padding()
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
