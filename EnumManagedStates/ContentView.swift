//
//  ContentView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/15/20.
//

import SwiftUI

struct ContentView: View {

    //@State var currentState
    // enum for Events
    // enum for States

    @ObservedObject var settings = AppSettings()
    
    // changeState takes in some event
    func changeState() {
        switch self.settings.state {
        case DataLoadingState.started:
            self.settings.state = DataLoadingState.offline

        case DataLoadingState.offline:
            self.settings.state = DataLoadingState.online
        case DataLoadingState.online:
            self.settings.state = DataLoadingState.loading
        case DataLoadingState.loading:
            self.settings.state = DataLoadingState.error
        case DataLoadingState.error:
            self.settings.state = DataLoadingState.success
        case DataLoadingState.success:
            self.settings.state = DataLoadingState.started
        }
    }


    var body: some View {
        VStack {
/*
            Button(action: {
                //
            }) {
                Text("Check Connectivity")
            }
            Button(action: {}) {
                Text("Go Offline")
            }
            Button(action: {}) {
                Text("Go Online")
            }
            Button(action: {}) {
                Text("Download")
            }
            Button(action: {}) {
                Text("Display")
            }
 */
            Button(action: {
                changeState()
            }, label: {
                Text("Change State")
            })
            Text("Current State:")
                .padding()
                .font(.largeTitle)
            Text("\(self.settings.state.rawValue)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
