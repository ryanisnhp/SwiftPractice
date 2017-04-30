//
//  ViewController.swift
//  Bowties
//
//  Created by Le Van Lam on 4/30/17.
//  Copyright © 2017 LeVanLam. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak fileprivate var segmentedControl: UISegmentedControl!
    @IBOutlet weak fileprivate var imageView: UIImageView!
    @IBOutlet weak fileprivate var nameLabel: UILabel!
    @IBOutlet weak fileprivate var ratingLabel: UILabel!
    @IBOutlet weak fileprivate var timesWornLabel: UILabel!
    @IBOutlet weak fileprivate var lastWornLabel: UILabel!
    @IBOutlet weak fileprivate var favoriteLabel: UILabel!
    
    var viewModel: ViewControllerModel!
    private var bowties: [Bowtie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Save test bow tie
        viewModel = ViewControllerModel(completion: { [weak self] (bowties) in
            guard let this = self else { return }
            this.bowties = bowties
        })
        viewModel.getData()
    }
    
    private func insertData() {
        
    }
    
    @IBAction func segmentedControl(control: UISegmentedControl) {
        
    }
    @IBAction func wear(sender: UIButton) {
        
    }
    @IBAction func rate(sender: UIButton) {
        
    }
}
