//
//  NetworkError.swift
//  LBGCodingTask
//
//  Created by Navi on 13/06/22.
//

import Foundation

/// Network failure cases
enum NetworkError: AlertData {
    case basic

    var title: String {
        "Oops! You're not online"
    }

    var description: String {
        "Please check your internet connection"
    }

    var actionTitle: String {
        "Dismiss"
    }
}
