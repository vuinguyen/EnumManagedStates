//
//  DataLoadingState.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/22/20.
//

import Foundation
import SwiftUI
import Combine

protocol printEnum {
    var description: String { get }
}

enum DataLoadingState: printEnum {

    var description: String {
        switch self {
        case .initial:
            return "Initial"
        case .offline:
            return "Offline"
        case .loading:
            return "Loading"
        case .error:
            return "Error"
        case .success(let thing):
            return "Success: \(thing.name)"
        }
    }

    case initial    
    case offline
    //case online // ? necessary
    case loading
    case error
    //case success
    case success(TheThing)
}



class EnvironmentSettings: ObservableObject {
    @Published var state: DataLoadingState = .initial
    @Published var internetConnected = true
    @Published var internetCallSucceeded = true

    let network = MyNetworkClass.shared

    func changeState() {
        switch state {
        case DataLoadingState.initial:
            if internetConnected == false {
                state = DataLoadingState.offline
            } else {
            //    outputState = DataLoadingState.online
            }
        case DataLoadingState.offline:
            if internetConnected {
          //      outputState = DataLoadingState.online
            } else {
                state = DataLoadingState.offline
            }
            /*
        case DataLoadingState.online:
            if internetConnected == false {
                outputState = DataLoadingState.offline
            } else {
                outputState = DataLoadingState.loading
            }
 */
        case DataLoadingState.loading:
            if internetConnected == false {
                state = DataLoadingState.offline
                return
            }
            if internetCallSucceeded == false {
                state = DataLoadingState.error
            } else {
 //               state = DataLoadingState.success
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
        case .success(let thing):
            //state = DataLoadingState.success
            state = .success(thing)
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
