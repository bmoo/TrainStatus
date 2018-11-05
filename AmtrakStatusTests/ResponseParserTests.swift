//
//  ResponseParserTests.swift
//  TrainStatusTests
//
//  Created by Brad Moore on 11/3/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import XCTest
@testable import AmtrakStatus

class ResponseParserTests: XCTestCase {
    
    func testNotYetArrived() {
        let path = Bundle(for: ResponseParserTests.self).path(forResource: "response", ofType: "txt")
        do {
            let content = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            XCTAssertEqual(ResponseParser.parse(body: content), "04:35 PM")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testArrived() {
        let path = Bundle(for: ResponseParserTests.self).path(forResource: "arrivedResponse", ofType: "txt")
        do {
            let content = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            XCTAssertNil(ResponseParser.parse(body: content))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testLateBeforeArrival() {
        let path = Bundle(for: ResponseParserTests.self).path(forResource: "sixminuteslate", ofType: "txt")
        do {
            let content = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            XCTAssertEqual(ResponseParser.parse(body: content), "04:41 PM")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

}
