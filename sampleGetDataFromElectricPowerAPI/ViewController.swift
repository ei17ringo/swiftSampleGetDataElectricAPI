//
//  ViewController.swift
//  sampleGetDataFromElectricPowerAPI
//
//  Created by Eriko Ichinohe on 2016/02/03.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBtn(sender: UIButton) {

        let df = NSDateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        var dateStr = df.stringFromDate(myDatePicker.date)
        
        var url = NSURL(string: "http://tepco-usage-api.appspot.com/\(dateStr)/0.json")
        var request = NSURLRequest(URL:url!)
        var jsondata = (try! NSURLConnection.sendSynchronousRequest(request, returningResponse: nil))
        let jsonDictionary = (try! NSJSONSerialization.JSONObjectWithData(jsondata, options: [])) as! NSDictionary
        for(key, data) in jsonDictionary{
            print("\(key)=\(data)")
        }
        
    }

}

