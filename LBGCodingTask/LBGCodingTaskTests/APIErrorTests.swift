//
//  APIErrorTests.swift
//  LBGCodingTaskTests
//
//  Created by Navi on 13/06/22.
//

import XCTest
@testable import LBGCodingTask

class APIErrorTests: XCTestCase {

    var sut_APIError: APIError?

    override func setUpWithError() throws {
        sut_APIError = APIError.invalidData
    }

    override func tearDownWithError() throws {
        sut_APIError = nil
    }

    func testContents_For_Invalid_Case_Error() {
        XCTAssertEqual(sut_APIError?.title, Values.titleForInvalidData)
        XCTAssertEqual(sut_APIError?.description, Values.descriptionForInvalidData)
        XCTAssertNotNil(sut_APIError?.actionTitle)
    }

    func testContents_For_Failure_Case_Error() {
        sut_APIError = .failure(message: "")
        XCTAssertEqual(sut_APIError?.title, Values.titleForFailure)
        XCTAssertEqual(sut_APIError?.description, Values.descriptionForFailure)
        XCTAssertNotNil(sut_APIError?.actionTitle)
    }

    func testContents_For_Non_Success_StatusCode_Error() {
        sut_APIError = .nonSuccessStatusCode(code: 404)
        XCTAssertEqual(sut_APIError?.title, Values.titleForNonSuccessStatusCode)
        XCTAssertEqual(sut_APIError?.description, Values.descriptionForNonSuccessStatusCode)
        XCTAssertEqual(sut_APIError?.actionTitle, Values.actionTitle)
    }
}

extension APIErrorTests {

    enum Values {
        static var titleForInvalidData = "Sorry"
        static var descriptionForInvalidData = "We are checking"
        static var titleForFailure = "Oops"
        static var descriptionForFailure = "Something went wrong with: "
        static var titleForNonSuccessStatusCode = "Don't worry"
        static var descriptionForNonSuccessStatusCode = "Failed with 404 code, Please try after sometime"
        static var failureStatusCode = 404
        static var actionTitle = "Ok"
    }
}
