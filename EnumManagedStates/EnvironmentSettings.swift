//
//  DataLoadingState.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/22/20.
//

import Foundation
import SwiftUI
import Combine

enum DataLoadingState: String {
    case started    // maybe initial
    case offline
    case online // ? necessary
    case loading
    case error
    case success
}

class EnvironmentSettings: ObservableObject {

    @Published var state: DataLoadingState = .started
    @Published var internetOffline = false
    @Published var errorLoading = false

    func changeState() {
        switch state {
        case DataLoadingState.started:
            if internetOffline {
                state = DataLoadingState.offline
            } else {
                state = DataLoadingState.online
            }
        case DataLoadingState.offline:
            if internetOffline == false {
                state = DataLoadingState.online
            } else {
                state = DataLoadingState.offline
            }
        case DataLoadingState.online:
            if internetOffline {
                state = DataLoadingState.offline
            } else {
                state = DataLoadingState.loading
            }
        case DataLoadingState.loading:
            if internetOffline {
                state = DataLoadingState.offline
                return
            }
            if errorLoading {
                state = DataLoadingState.error
            } else {
                state = DataLoadingState.success
            }
        case DataLoadingState.error:
            state = DataLoadingState.loading
        case DataLoadingState.success:
            state = DataLoadingState.started
        }
    }
}

struct AppSettings_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
