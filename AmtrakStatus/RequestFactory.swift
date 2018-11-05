//
//  RequestFactory.swift
//  TrainStatus
//
//  Created by Brad Moore on 10/31/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import Foundation
import os

public class RequestFactory {
    public static func newRequest(day: Int, month: Int, year: Int) -> URLRequest? {
        guard let url = URL(string: "https://tickets.amtrak.com/itd/amtrak") else {
            os_log("Couldn't parse the URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", forHTTPHeaderField: "Accept")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("en-us", forHTTPHeaderField: "Accept-Language")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15", forHTTPHeaderField: "User-Agent")
        request.addValue("https://www.amtrak.com/home.html", forHTTPHeaderField: "Referer")
        request.addValue("br, gzip, deflate", forHTTPHeaderField: "Accept-Encoding")
        
        request.httpBody = "%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2F%40trainStatusType=statusByTrainNumber&wdf_trainNumber=785&wdf_destination=SOL&statesType=AL&statesType=AB&countryType=US&radioSelect=arrivalTime&wdf_SortBy=arrivalTime&%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2FjourneyRequirements%5B1%5D%2FdepartDate.usdate=\(month)%2F\(day)%2F\(year)&requestor=amtrak.presentation.handler.page.AmtrakCMSNavigationTabPageHandler&%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2F%40trainStatusType=statusByTrainNumber&xwdf_SortBy=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2FjourneyRequirements%5B1%5D%2FdepartDate%2F%40radioSelect&xwdf_origin=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtravelSelection%2FjourneySelection%5B1%5D%2FdepartLocation%2Fsearch&wdf_origin+value=&wdf_origin=&wdf_destination=&xwdf_destination=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtravelSelection%2FjourneySelection%5B1%5D%2FarriveLocation%2Fsearch&xwdf_trainNumber=%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%2FtripRequirements%2FjourneyRequirements%5B1%5D%2FsegmentRequirements%5B1%5D%2FserviceCode&_handler%3Damtrak.presentation.handler.request.rail.AmtrakRailTrainStatusSearchRequestHandler%2F_xpath%3D%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D=&_handler%3Damtrak.presentation.handler.request.rail.AmtrakRailTrainStatusSearchRequestHandler%2F_xpath%3D%2FsessionWorkflow%2FproductWorkflow%5B%40product%3D%27Rail%27%5D%3ASEARCH=".data(using: String.Encoding.utf8)
        
        return request
    }
}
