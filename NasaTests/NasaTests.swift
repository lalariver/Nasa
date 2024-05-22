//
//  NasaTests.swift
//  NasaTests
//
//  Created by user on 2024/5/9.
//

import XCTest
@testable import Nasa

final class NasaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJson() {
        do {
            let url = Bundle.main.url(forResource: "JsonFile", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let list = try JSONDecoder().decode([NasaDatum].self, from: data)
            XCTAssertNotNil(list)
            
            var model = list[0]
            XCTAssertEqual("A Year of Extraterrestrial Fountains and Flows", model.title)
            
            model = list[1]
            XCTAssertEqual("Digital Illustration Credit & Copyright: Dennis Mammana (Skyscapes)", model.copyright)
            
            model = list[2]
            XCTAssertEqual("2006 Dec. 29", model.dateString)
        } catch {
            debugPrint(error.localizedDescription)
            XCTFail()
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
