//
//  ResponseHandler+Extension.swift
//  LBGCodingTask
//
//  Created by Navi on 11/06/22.
//

import Foundation

extension ResponseHandler {

    func defaultParseResponse<T: Decodable>(data: Data, response: HTTPURLResponse) throws -> T {
        let jsonDecoder = JSONDecoder()
        do {
            let result = try jsonDecoder.decode(T.self, from: data)
            if response.isValid() {
                return result
            } else {
                throw APIError.nonSuccessStatusCode(code: response.statusCode)
            }
        } catch {
            throw APIError.invalidData
        }
    }
}
