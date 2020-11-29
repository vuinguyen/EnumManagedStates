//
//  EnvironmentSettings.swift
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
    case loading
    case error
    case success(TheThing)
}



class EnvironmentSettings: ObservableObject {
    @Published var usingStates = true
    @Published var state: DataLoadingState = .initial
    @Published var booleanFlagMessages = ""
    @Published var internetConnected = true
    @Published var internetCallSucceeded = true
    @Published var imageName = ""

    let network = MyNetworkClass.shared
    let noImage = ""
    let noMessages = ""

    private func setImage(imageName: String) {
        self.imageName = imageName
    }

    func startOver() {
        state = .initial
        booleanFlagMessages = noMessages
        setImage(imageName: noImage)
    }

    func makeNetworkCall() {
        state = .loading
        setImage(imageName: noImage)

        network.getTheThing(internetConnected: internetConnected, internetCallSucceeded: internetCallSucceeded) { [weak self] (result) in
            self?.handleResult(result)
        }

    }

    private func handleResult(_ result: MyNetworkClass.ThingResult) {
        switch result {
        case .success(let thing):
            state = .success(thing)
            // display downloaded thing
            setImage(imageName: thing.name)
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

    func makeNetworkCallBooleans() {
        booleanFlagMessages = "Downloading. Checking flags:\ndata,error,error domain,\nerror code,data name"
        setImage(imageName: noImage)
        network.getTheThingTheHardWay(internetConnected: internetConnected, internetCallSucceeded: internetCallSucceeded) { [weak self] (thing, error) in
            self?.handleResultBooleans(thing: thing, error: error)
        }
    }

    private func handleResultBooleans(thing: TheThing?, error: NSError?) {
        guard error == nil else {
            if let domain = error?.domain,
               let code = error?.code {
                if domain == NSURLErrorDomain,
                   code == NSURLErrorNotConnectedToInternet {
                    booleanFlagMessages = "Internet is Offline!\nConnect to internet"
                } else {
                    booleanFlagMessages = "Server error!"
                }
            }
            return
        }

        if thing == nil {
            return
        }

        if let imageName = thing?.name {
            setImage(imageName: imageName)
            booleanFlagMessages = "Image Displayed"
        }
    }

}
