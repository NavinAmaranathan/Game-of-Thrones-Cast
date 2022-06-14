//
//  CharactersAPI.swift
//  LBGCodingTask
//
//  Created by Navi on 11/06/22.
//

import Foundation

struct CharactersAPI: APIHandler {
    func makeRequest(from url: URL) -> URLRequest? {
        return defaultMakeRequest(from: url)
    }

    func parseResponse(data: Data, response: HTTPURLResponse) throws -> Characters {
        return try defaultParseResponse(data: data, response: response)
    }
}
