//
//  APIHandler.swift
//  LBGCodingTask
//
//  Created by Navi on 11/06/22.
//

import Foundation

typealias APIHandler = RequestHandler & ResponseHandler

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol RequestHandler {
    associatedtype RequestDataType

    /// Use to build the request necessary for API call
    /// - Parameters:
    /// - data: Associated data type that can be passed for making the request
    /// - Returns: Gives an optional URLRequest
    func makeRequest(from data: RequestDataType) -> URLRequest?
}

protocol ResponseHandler {
    associatedtype ResponseDataType

    /// Use to parse the response returned from API
    /// - Parameters:
    /// -  data: Individual character data
    /// -  response: Type of response from backend
    /// - Returns: Associated data type after parsing the data
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ResponseDataType
}
