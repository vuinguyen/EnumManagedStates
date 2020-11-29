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
        VStack(alignment: .center) {
            EnvironmentView()
            Button(action: {
                self.settings.startOver()
            }) {
                Text("Start Over")
            }
            .padding()
            Button(action: {
                self.settings.makeNetworkCall()
            }) {
                Text("Download Data")
            }
            Text("State:")
                .padding()
                .font(.largeTitle)
            //Text("\(self.settings.state.rawValue)")
            Text("\(self.settings.state.description)")
                .foregroundColor(Color.purple)
                .padding()
                .font(.title)
            if self.settings.imageName != self.settings.noImage {
                Image("\(self.settings.imageName)")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/160.0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EnvironmentSettings())
    }
}
