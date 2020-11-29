//
//  EnvironmentView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/27/20.
//

import SwiftUI

struct EnvironmentView: View {
    @EnvironmentObject var settings: EnvironmentSettings

    var body: some View {
        VStack {
            Toggle(isOn: self.$settings.internetConnected, label: {
                Text("Internet Connected")
            }).padding()
            Toggle(isOn: self.$settings.internetCallSucceeded, label: {
                Text("Server Responding")
            }).padding()
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().environmentObject(EnvironmentSettings())
    }
}
