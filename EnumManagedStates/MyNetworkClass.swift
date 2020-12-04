//
//  MyNetworkClass.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/28/20.
//

import Foundation
import SwiftUI
import Combine

struct TheThing {
    let name: String
}

class MyNetworkClass {
    static var shared = MyNetworkClass()
    typealias ThingResult = Result<TheThing, NSError>
    private var timer: Timer?

    func getTheThingTheHardWay(internetConnected: Bool, internetCallSucceeded: Bool, completion: @escaping (TheThing?, NSError?) -> Void) {
        timer?.invalidate()
        timer = nil

        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            if internetConnected == false {
                let error = NSError(domain: NSURLErrorDomain,
                                    code: NSURLErrorNotConnectedToInternet,
                                    userInfo: nil)
                completion(nil, error)
                return
            } else if internetCallSucceeded == false {
                let error = NSError(domain: NSURLErrorDomain,
                                    code: 500,
                                    userInfo: nil)
                completion(nil, error)
            } else {
                let thing = TheThing(name: "HappyCrab")
                completion(thing, nil)
            }
        }
    }

    func getTheThing(internetConnected: Bool, internetCallSucceeded: Bool, completion: @escaping (ThingResult) -> Void) {
        timer?.invalidate()
        timer = nil

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            if internetConnected == false {
                let error = NSError(domain: NSURLErrorDomain,
                                    code: NSURLErrorNotConnectedToInternet,
                                    userInfo: nil)
                completion(.failure(error))
                return
            }
            else if internetCallSucceeded == false {
                let error = NSError(domain: NSURLErrorDomain,
                                    code: 500,
                                    userInfo: nil)
                completion(.failure(error))
            }
            else {
                let thing = TheThing(name: "HappyCrab")
                completion(.success(thing))
            }
        }
    }
}
