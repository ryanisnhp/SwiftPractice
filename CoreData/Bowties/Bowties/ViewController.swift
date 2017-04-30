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
    
    var viewModel: ViewControllerModel! {
        didSet {
            viewModel.senderData = { [weak self] currentBowtie in
                guard let this = self, let currentBowtie = currentBowtie else { return }
                this.imageView.image = currentBowtie.image
                this.nameLabel.text = currentBowtie.name
                this.ratingLabel.text = currentBowtie.ratingLabel
                this.timesWornLabel.text = currentBowtie.timesWornLabel
                this.lastWornLabel.text = currentBowtie.lastWornLabel
                this.favoriteLabel.isHidden = currentBowtie.isHidden
                this.view.tintColor = currentBowtie.color
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Save test bow tie
        viewModel = ViewControllerModel()
        guard let title = segmentedControl.titleForSegment(at: 0) else { return }
        viewModel.bowtieForSegment(at: title)
    }
    
    @IBAction func segmentedControl(control: UISegmentedControl) {
        guard let title = segmentedControl.titleForSegment(at: control.selectedSegmentIndex) else { return }
        viewModel.bowtieForSegment(at: title)
    }
    @IBAction func wear(sender: UIButton) {
        viewModel.updateBowtie()
    }
    @IBAction func rate(sender: UIButton) {
        let alert = viewModel.showAlert(save: { [weak self] text in
            guard let this = self else { return }
            this.viewModel.updateRating(string: text)
        }, cancel: nil)
        present(alert, animated: true, completion: nil)
    }
}
