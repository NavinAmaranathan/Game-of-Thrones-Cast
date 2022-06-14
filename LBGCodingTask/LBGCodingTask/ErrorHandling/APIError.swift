//
//  APIError.swift
//  LBGCodingTask
//
//  Created by Navi on 11/06/22.
//

import Foundation

/// API failure cases
enum APIError: AlertData {
    case failure(message: String)
    case invalidData
    case invalidRequest
    case invalidUrl
    case nonSuccessStatusCode(code: Int)

    var title: String {
        switch self {
        case .failure:
            return "Oops"
        case .invalidData, .invalidRequest, .invalidUrl:
          return "Sorry"
        case .nonSuccessStatusCode:
            return "Don't worry"
        }
    }

    var description: String {
        switch self {
        case .failure(let message):
            return "Something went wrong with: \(message)"
        case .invalidData, .invalidRequest, .invalidUrl:
            return "We are checking"
        case .nonSuccessStatusCode(let code):
            return "Failed with \(code) code, Please try after sometime"
        }
    }

    var actionTitle: String {
        "Ok"
    }
}
