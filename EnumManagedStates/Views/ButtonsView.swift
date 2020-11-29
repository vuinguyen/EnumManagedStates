//
//  ButtonsView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/29/20.
//

import SwiftUI

struct ButtonsView: View {
    @EnvironmentObject var settings: EnvironmentSettings

    var body: some View {
        VStack {
            Button(action: {
                self.settings.startOver()
            }) {
                Text("Start Over")
            }
            .padding()
            Button(action: {
                if self.settings.usingStates { self.settings.makeNetworkCall()
                } else {
                    self.settings.makeNetworkCallBooleans()
                }
            }) {
                Text("Download Data")
            }
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView().environmentObject(EnvironmentSettings())
    }
}
