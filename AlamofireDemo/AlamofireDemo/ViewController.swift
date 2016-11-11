//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Lam Le Van on 11/11/16.
//  Copyright © 2016 Asian Tech. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction private func testingButton() {
        PreditionGettor.sharedInstance.getPreditions { (preditions) in
            if let places = preditions?.place {
                for place in places {
                    print("1-----------------------")
                    print(place.description)
                    print(place.id)
                    print(place.placeID)
                    print("MatchedSubString---------------")
                    for matchedSubString in place.machedSubstring {
                        print(matchedSubString.length)
                        print(matchedSubString.offset)
                    }
                    print("StructedFormatString-----------")
                    if let structedFormatString = place.structedFormatString {
                        print(structedFormatString.secondaryText)
                        for mainText in structedFormatString.mainTextMatchedSubstrings {
                            print(mainText.length)
                            print(mainText.offset)
                        }
                    }
                    print("Term--------------------------------------")
                    for term in place.terms {
                        print(term.offset)
                        print(term.value)
                    }
                }
            }
        }
    }
}
