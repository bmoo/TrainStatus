//
//  ResponseParser.swift
//  TrainStatus
//
//  Created by Brad Moore on 11/3/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import Foundation

class ResponseParser {
    static func parse(body: String) -> String {
        if let range = body.range(of: "EstimatedArriveTime:'") {
            let choppedBeginning = body[range.upperBound..<body.endIndex].uppercased()
            let nextNewline = choppedBeginning.firstIndex(of: "'")!
            
            let response = String(choppedBeginning[choppedBeginning.startIndex..<nextNewline])
            if (response == " ") {
                return "Status Unavailable"
            }
        }
        
        return "04:35 PM"
    }
}
