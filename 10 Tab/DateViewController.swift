//
//  ViewController.swift
//  DatePicker
//
//  Created by JeonGukhwa on 25.03.20.
//  Copyright © 2020 JeonGukhwa. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblChosenTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // every 1s, print current time
        // selector: 타이머가 구동될 때 실행 될 함수
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 이거 주석처리 하고 바로 sender써도 동작함
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // E, EE 도 동작함
        
        lblChosenTime.text =
            "Chosen Time: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        
        let date = NSDate() // current time
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblCurrentTime.text = "Current Time: " + formatter.string(from: date as Date)
    }
    
}

