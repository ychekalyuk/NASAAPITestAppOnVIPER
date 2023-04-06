//
//  APINasaVIPERTestAppTests.swift
//  APINasaVIPERTestAppTests
//
//  Created by Юрий Альт on 10.02.2023.
//

import XCTest
@testable import APINasaVIPERTestApp

final class APINasaVIPERTestAppTests: XCTestCase {

    var sut: NetworkManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NetworkManager()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testFetchDataReturnsIsntNilOrIsntEmptyArrayWithModels() {
        let expectation = XCTestExpectation(description: "Fetch data from API")
        sut.fetchData { apods in
            XCTAssertNotNil(apods)
            XCTAssertTrue(apods.count > 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }


    func testPerformanceExample() throws {
        measure {
            
        }
    }
}
