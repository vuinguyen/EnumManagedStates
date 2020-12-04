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
            ButtonsView()
            MessagesView()
            ImageDisplayView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
            .environmentObject(EnvironmentSettings())
    }
}
