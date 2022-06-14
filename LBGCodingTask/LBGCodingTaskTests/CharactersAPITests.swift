//
//  CharactersAPITests.swift
//  LBGCodingTaskTests
//
//  Created by Navi on 13/06/22.
//

import XCTest
@testable import LBGCodingTask

class CharactersAPITests: XCTestCase {

    var sutCharactersAPI: CharactersAPI?

    override func setUpWithError() throws {
        sutCharactersAPI = CharactersAPI()
    }

    override func tearDownWithError() throws {
        sutCharactersAPI = nil
    }

    func test_RequestGeneration_Success() {
        XCTAssertNotNil(sutCharactersAPI?.makeRequest(from: Values.sampleUrl))
    }

    func test_ResponseParse_Failure() {
        let expectation = XCTestExpectation(description: #function)
        do {
            let result = try sutCharactersAPI?.parseResponse(data: Values.sampleData, response: Values.sampleResponse)
            XCTAssertNil(result)
        } catch let error {
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
    }
}

extension CharactersAPITests {
    enum Values {
        static var sampleUrl: URL = URL(string: "https://thronesapi.com/api/v2/Continents")!
        static var sampleData: Data = Data()
        static var sampleResponse: HTTPURLResponse = HTTPURLResponse()
    }
}
