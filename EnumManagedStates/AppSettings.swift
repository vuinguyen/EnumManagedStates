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
}
