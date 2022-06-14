//
//  APILoader.swift
//  LBGCodingTask
//
//  Created by Navi on 11/06/22.
//

import Foundation

struct APILoader<T: APIHandler> {
    var apiHandler: T
    var urlSession: URLSession

    /// Init the API Loader
    /// - Parameters:
    ///   - apiHandler: Handler that takes care of request and response
    ///   - urlSession: Used for network call
    init(apiHandler: T, urlSession: URLSession = .shared) {
        self.apiHandler = apiHandler
        self.urlSession = urlSession
    }

    /// Fetches the data from server
    /// - Parameter requestData: Type of request input
    /// - Returns: User requested data type
    func loadAPIRequest(requestData: T.RequestDataType) async throws -> T.ResponseDataType? {
        if let urlRequest = apiHandler.makeRequest(from: requestData) {
            do {
                let (data, urlResponse) = try await urlSession.data(for: urlRequest, delegate: nil)
                if let httpResponse = urlResponse as? HTTPURLResponse {
                    return try apiHandler.parseResponse(data: data, response: httpResponse)
                }
            } catch {
                throw APIError.failure(message: error.localizedDescription)
            }
        }
        throw APIError.invalidRequest
    }
}
