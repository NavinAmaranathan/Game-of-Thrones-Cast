//
//  RequestHandler+Extension.swift
//  LBGCodingTask
//
//  Created by Navi on 11/06/22.
//

import Foundation

extension RequestHandler {

    func defaultMakeRequest(from url: URL) -> URLRequest? {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
    }
}
