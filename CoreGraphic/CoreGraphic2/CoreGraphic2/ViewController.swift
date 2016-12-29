//
//  ViewController.swift
//  CoreGraphic2
//
//  Created by Lam Le Van on 12/24/16.
//  Copyright © 2016 dev.asiantech.lamlv. All rights reserved.
//
//https://www.raywenderlich.com/90693/modern-core-graphics-with-swift-part-2
import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterView: CounterView!
    @IBOutlet private weak var graphView: GraphView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = "\(counterView.counter)"
        }
    }
    @IBOutlet private var dayLabels: [UILabel]!
    @IBOutlet private weak var maxLabel: UILabel!
    @IBOutlet private weak var averageWaterDrunk: UILabel!
    var isGraphViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - Private method
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeView))
        containerView.addGestureRecognizer(gesture)
    }
    
    private func setupGraphDisplay() {
        //Use 7 days for graph - can use any number, but labels and sample data are set up for 7 days
        let noOfDays: Int = 7
        
        //1 - replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count-1] = counterView.counter
        //2 - Indicate that the graph needs to be reddrawn
        graphView.setNeedsDisplay()
        maxLabel.text = "\(graphView.graphPoints.max())"
        
        // Calculate average from graphPoints
        let average = graphView.graphPoints.reduce(0, +)/graphView.graphPoints.count
        averageWaterDrunk.text = "\(average)"
        
        //Set up labels
        //day of week labels are set up in storyboard with tags
        //today is last day of the array need to go backwards
        
        //4 - get today's day number
        let calendar = NSCalendar.current
        let components = calendar.component(Calendar.Component.weekday, from: Date())
        var weekday = components
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        
        //5 - set up the name labels with correct day
        for i in 1...days.reversed().count {
            if weekday == 7 {
                weekday = 0
            }
            dayLabels[i].text = days[weekday]
            weekday = weekday - 1
            if weekday < 0 {
                weekday = days.count - 1
            }
        }
    }
    
    @objc private func changeView(gesture: UITapGestureRecognizer?) {
        if isGraphViewShowing {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            if counterView.counter < CounterView.NoOfGlasses {
                counterView.counter = counterView.counter + 1
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter = counterView.counter - 1
            }
        }
    }
}
