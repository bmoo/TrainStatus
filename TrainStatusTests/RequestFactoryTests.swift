//
//  RequestFactoryTests.swift
//  TrainStatusTests
//
//  Created by Brad Moore on 10/31/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import XCTest
@testable import TrainStatus

class RequestFactoryTests: XCTestCase {
    
    func testHttpMethod() {
        let result = RequestFactory.newRequest(day: 1, month: 2, year: 2017)!
        XCTAssertEqual("POST", result.httpMethod)
    }
    
    func testRequestValues() {
        let result = RequestFactory.newRequest(day: 1, month: 2, year: 2017)!
        let fields = result.allHTTPHeaderFields!
        
        XCTAssertEqual("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", fields["Accept"])
        XCTAssertEqual("application/x-www-form-urlencoded", fields["Content-Type"])
        XCTAssertEqual("en-us", fields["Accept-Language"])
        XCTAssertEqual("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15", fields["User-Agent"])
        XCTAssertEqual("https://www.amtrak.com/home.html", fields["Referer"])
        XCTAssertEqual("br, gzip, deflate", fields["Accept-Encoding"])
    }
    
    func testBodyMap() {
        let result = RequestFactory.newRequest(day: 1, month: 2, year: 2017)!

        let optionalBody = result.httpBody
        
        XCTAssertNotNil(optionalBody)
        
        let bodyString = String(data: optionalBody!, encoding: String.Encoding.utf8)
    XCTAssertEqual("%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2F%40trainStatusType=statusByTrainNumber&wdf_trainNumber=785&wdf_destination=SOL&statesType=AL&statesType=AB&countryType=US&radioSelect=arrivalTime&wdf_SortBy=arrivalTime&%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2FjourneyRequirements%5B1%5D%2FdepartDate.usdate=2%2F1%2F2017&requestor=amtrak.presentation.handler.page.AmtrakCMSNavigationTabPageHandler&%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2F%40trainStatusType=statusByTrainNumber&xwdf_SortBy=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2FjourneyRequirements%5B1%5D%2FdepartDate%2F%40radioSelect&xwdf_origin=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtravelSelection%2FjourneySelection%5B1%5D%2FdepartLocation%2Fsearch&wdf_origin+value=&wdf_origin=&wdf_destination=&xwdf_destination=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtravelSelection%2FjourneySelection%5B1%5D%2FarriveLocation%2Fsearch&xwdf_trainNumber=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2FjourneyRequirements%5B1%5D%2FsegmentRequirements%5B1%5D%2FserviceCode&_handler%3Damtrak.presentation.handler.request.rail.AmtrakRailTrainStatusSearchRequestHandler%2F_xpath%3D%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D=&_handler%3Damtrak.presentation.handler.request.rail.AmtrakRailTrainStatusSearchRequestHandler%2F_xpath%3D%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%3ASEARCH=", bodyString)
    }

}
