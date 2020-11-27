//
//  ContentView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/15/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings : EnvironmentSettings
    
    // can we make these State variables Observed / Environment?
    // internet offline is a confusing label - double negative?
    //@State var internetOffline = false
   // @State var errorLoading = false

    var body: some View {
        VStack {
            EnvironmentView()
            Text("Input State:")
                .padding()
                .font(.largeTitle)
            Text("\(self.settings.state.rawValue)")
                .foregroundColor(Color.green)
                .padding()
                .font(.title)
            Button(action: {
                settings.changeState()
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
        ContentView().environmentObject(EnvironmentSettings())
    }
}
