//
//  AssignmentTests.swift
//  AssignmentTests
//

import XCTest

class AssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWeatherForecastApiData() {
        let promise = expectation(description: "Completion handler invoked")
        let cityViewModel = CityViewModel()
        
        let cityLocCompletionClosure = {( data: CurrentForeCast ) -> Void in
            promise.fulfill()
            XCTAssert(data.coord?.lat != nil && data.coord?.lon != nil)
            XCTAssertTrue(data.id == 302800)
        }
        
        cityViewModel.getForeCastData(latitude: "37.33", longitude: "37.33", completionHanlder: cityLocCompletionClosure)
        wait(for: [promise], timeout: 20)
    }
    
}
