//
//  AlertHandlerTests.swift
//  LBGCodingTaskTests
//
//  Created by Navi on 13/06/22.
//

import XCTest
@testable import LBGCodingTask

class AlertHandlerTests: XCTestCase {

    private var demoViewController: UIViewController?

    override func setUpWithError() throws {
        demoViewController = UIViewController()
    }

    override func tearDownWithError() throws {
        demoViewController = nil
    }

    func test_DisplayAlert_ForInvalidData() {
        AlertHandler.shared.show(over: demoViewController!, type: .invalidData)
    }

    func test_DisplayAlert_ForNetworkIssue() {
        AlertHandler.shared.show(over: demoViewController!, type: .basic)
    }
}
