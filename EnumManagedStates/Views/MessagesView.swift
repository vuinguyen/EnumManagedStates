//
//  MessagesView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/29/20.
//

import SwiftUI

struct MessagesView: View {
    @EnvironmentObject var settings: EnvironmentSettings

    var body: some View {
        VStack {
            if self.settings.usingStates {
                Text("State:")
                    .padding()
                    .font(.largeTitle)
                Text("\(self.settings.state.description)")
                    .foregroundColor(Color.purple)
                    .padding()
                    .font(.title)
            } else {
                Text("Messages:")
                    .padding()
                    .font(.title2)
                Text("\(self.settings.booleanFlagMessages)")
                    .foregroundColor(Color.purple)
                    .font(.callout)
                    .lineLimit(4)
                    .multilineTextAlignment(.center)
                    .allowsTightening(true)
                    .frame(width: 250)
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView().environmentObject(EnvironmentSettings())
    }
}
