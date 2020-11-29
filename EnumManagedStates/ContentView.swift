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
            Text("Input State:")
                .padding()
                .font(.largeTitle)
            Text("\(self.settings.state.rawValue)")
                .foregroundColor(Color.green)
                .padding()
                .font(.title)
            /*
            Button(action: {
                settings.changeState()
            }, label: {
                Text("Evaluate State")
            })
 */
            Button(action: {
                self.settings.makeNetworkCall()
            }) {
                Text("Download Data")
            }
            /// Put output state display here
            
            // Label : Input state
            // Label : Output state
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EnvironmentSettings())
    }
}
