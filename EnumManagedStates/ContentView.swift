//
//  ContentView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/15/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings : EnvironmentSettings

    var body: some View {
        VStack {
            Button(action: {
                self.settings.startOver()
            }) {
                Text("Start Over")
            }
            EnvironmentView()
            Text("State:")
                .padding()
                .font(.largeTitle)
            //Text("\(self.settings.state.rawValue)")
            Text("\(self.settings.state.description)")
                .foregroundColor(Color.purple)
                .padding()
                .font(.title)
            Button(action: {
                self.settings.makeNetworkCall()
            }) {
                Text("Download Data")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EnvironmentSettings())
    }
}
