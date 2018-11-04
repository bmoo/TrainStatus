//
//  ViewController.swift
//  TrainStatus
//
//  Created by Brad Moore on 10/31/18.
//  Copyright © 2018 Brad Moore. All rights reserved.
//

import UIKit
import os

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeLabel.text = "Loading..."
        
        
        let currentDate = Date()
        let day = Calendar.current.component(.day, from: currentDate)
        let month = Calendar.current.component(.month, from: currentDate)
        let year = Calendar.current.component(.year, from: currentDate)

        let request = RequestFactory.newRequest(day: day, month: month, year: year)!
        
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: dataCallback)
        dataTask.resume()
    }

    func dataCallback(data: Data?, response: URLResponse?, error: Error?) -> Void {
        let parsedData = ResponseParser.parse(body: String(data: data!, encoding: String.Encoding.utf8)!)
        os_log("Got %@", parsedData)
        DispatchQueue.main.async {
            self.timeLabel.text = parsedData
        }
    }
}
