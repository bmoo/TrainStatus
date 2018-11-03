//
//  ResponseParserTests.swift
//  TrainStatusTests
//
//  Created by Brad Moore on 11/3/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import XCTest
@testable import TrainStatus

class ResponseParserTests: XCTestCase {
    
    var content: String = ""

    override func setUp() {
        let path = Bundle(for: ResponseParserTests.self).path(forResource: "response", ofType: "txt")
        do {
            content = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        } catch {
            XCTFail(error.localizedDescription)
        }
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertEqual(ResponseParser.parse(body: content), "04:35 PM")
    }

}
