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
    case started
    case offline
    case online
    case loading
    case error
    case success
}

class AppSettings: ObservableObject {

    @Published var state: DataLoadingState = .started

    func changeState(internetOffline: Bool, errorLoading: Bool) {
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
