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
    case initial    // maybe initial
    case offline
    case online // ? necessary
    case loading
    case error
    case success
}

class EnvironmentSettings: ObservableObject {
    @Published var state: DataLoadingState = .initial
    @Published var inputState: DataLoadingState = .initial
    @Published var internetConnected = true
    @Published var internetCallSucceeded = true

    let network = MyNetworkClass.shared

    func changeState() {
        switch state {
        case DataLoadingState.initial:
            if internetConnected == false {
                state = DataLoadingState.offline
            } else {
                state = DataLoadingState.online
            }
        case DataLoadingState.offline:
            if internetConnected {
                state = DataLoadingState.online
            } else {
                state = DataLoadingState.offline
            }
        case DataLoadingState.online:
            if internetConnected == false {
                state = DataLoadingState.offline
            } else {
                state = DataLoadingState.loading
            }
        case DataLoadingState.loading:
            if internetConnected == false {
                state = DataLoadingState.offline
                return
            }
            if internetCallSucceeded == false {
                state = DataLoadingState.error
            } else {
                state = DataLoadingState.success
            }
        case DataLoadingState.error:
            state = DataLoadingState.loading
        case DataLoadingState.success:
            state = DataLoadingState.initial
        }
    }

    func startOver() {
        state = .initial
    }

    func makeNetworkCall() {
        state = .loading

        network.getTheThing(internetConnected: internetConnected, internetCallSucceeded: internetCallSucceeded) { [weak self] (result) in
            self?.handleResult(result)
        }

    }

    private func handleResult(_ result: MyNetworkClass.ThingResult) {
        switch result {
        case .success:
            state = DataLoadingState.success
        case .failure(let error):
            if error.domain == NSURLErrorDomain,
               error.code == NSURLErrorNotConnectedToInternet {
                state = .offline
            }
            else {
                state = .error
            }
        }
    }
}

struct EnvironmentSettings_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
