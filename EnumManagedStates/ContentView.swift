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
                Text("Download Data (Enums)")
            }
            Button(action: {
                self.settings.makeNetworkCallBooleans()
            }) {
                Text("Download Data (Booleans)")
            }
            .padding()
            Text("State:")
                .padding()
                .font(.largeTitle)
            //Text("\(self.settings.state.rawValue)")
            Text("\(self.settings.state.description)")
                .foregroundColor(Color.purple)
                .padding()
                .font(.title)
            /*
            if self.settings.imageName != self.settings.noImage {
                Image("\(self.settings.imageName)")
                .resizable()
                .frame(width: 150, height: 120)
            }  else {
                EmptyView()
                .fixedSize()
                .frame(width: 150, height: 120)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
 */
            ImageDisplayView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(EnvironmentSettings())
    }
}
