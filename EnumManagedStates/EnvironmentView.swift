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

            Toggle(isOn: self.$settings.internetOffline, label: {
                Text("Internet Offline")
            }).padding()
            Toggle(isOn: self.$settings.errorLoading, label: {
                Text("Error Loading")
            }).padding()
           // Text("Hello World!" + "\(self.$settings.errorLoading)")
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().environmentObject(EnvironmentSettings())
    }
}
