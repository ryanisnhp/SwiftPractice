//
//  ViewController.swift
//  Calendar1
//
//  Created by Lam Le Van on 2/10/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var monthLyLabel: UILabel!
    @IBAction private func testButton(button: UIButton) {
        grabData()
        myCallView()
    }
    
    private var numDays = 0
    private var thisYear = 0
    private var weekDay = 0
    private var thisMonth = 0
    
    var createAt: [Date] = []
    var parseSpot3: [String] = []
    var hadSession: [String] = []
    var dayButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grabData()
        myCallView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func grabData() {
        
    }
    
    private func myCallView() {
        let cal = Calendar.current
        let comps2 = cal.dateComponents([.year, .month], from: Date())
        if let thisYear = comps2.year {
            self.thisYear = thisYear
        }
        if let thisMonth = comps2.month {
            self.thisMonth = thisMonth
        }
        moreDataInfo()
    }
    
    private func moreDataInfo() {
        let gregorian = Calendar(identifier: .gregorian)
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = 1
        components.month = thisMonth
        components.year = thisYear
        
        let newDate = calendar.date(from: components)
        if let newDate = newDate {
            let comps = gregorian.dateComponents([.weekday], from: newDate)
            numDays = newDate.daysInMonth
            self.weekDay = comps.weekday ?? 1
            var newWeekDay = weekDay - 1
            let yVal = 175
            var yCount = 1
            let formatter = DateFormatter()
            monthLyLabel.text = formatter.monthSymbols[thisMonth - 1]
            
            //use for loop to dispalay each day
            for startDay in 1...numDays {
                let dayButton = UIButton(type: .roundedRect)
                let xCoord = newWeekDay*40+15
                let yCoord = yCount*30+yVal
                newWeekDay = newWeekDay + 1
                if newWeekDay > 6 {
                    newWeekDay = 0
                    yCount = yCount + 1
                }
                dayButton.frame = CGRect(x: xCoord, y: yCoord, width: 35, height: 25)
                dayButton.setTitle("\(startDay)", for: .normal)
                dayButton.setTitleColor(UIColor.red, for: UIControlState.normal)
                dayButton.addTarget(self, action: #selector(popupInfo), for: .touchUpInside)
                dayButton.tag = startDay
                view.addSubview(dayButton)
            }
        }
    }
    
    @objc private func popupInfo(button: UIButton) {
        
    }
}
