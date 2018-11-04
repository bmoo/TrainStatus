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
        // Do any additional setup after loading the view, typically from a nib.
        let request = RequestFactory.newRequest(day: 3, month: 11, year: 2018)!
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            let parsedData = ResponseParser.parse(body: String(data: data!, encoding: String.Encoding.utf8)!)
            os_log("Got %@", parsedData)
            DispatchQueue.main.async {
                self.timeLabel.text = parsedData
            }
        }
        dataTask.resume()

    }


}

