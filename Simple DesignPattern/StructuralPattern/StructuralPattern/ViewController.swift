//
//  ViewController.swift
//  StructuralPattern
//
//  Created by Lam Le Van on 1/31/17.
//  Copyright © 2017 dev.asiantech.lamlv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        useDecoratorPattern()
//        useProxyPattern()
//        useBridgePattern()
        useCompositePattern()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func useDecoratorPattern() {
        let rectangle = Rectangle()
        let square = Square()
        let roundedRectangle = RoundedCornerShapeDecorator(decoratedShape: rectangle)
        let roundedSquare = RoundedCornerShapeDecorator(decoratedShape: square)
        print(rectangle.draw())
        print(square.draw())
        print(roundedRectangle.draw())
        print(roundedSquare.draw())
    }
    
    private func useProxyPattern() {
        let animation = ScreenShot()
        print(animation.display())
        print(animation.click())
        print( animation.display())
    }
    
    private func useBridgePattern() {
        let tvRemoteControl = RemoteControl(concreteImpl: TV())
        let lightRemoteControl = RemoteControl(concreteImpl: Light())
        print(tvRemoteControl.turnOn())
        print(lightRemoteControl.turnOn())
    }
    
    private func useCompositePattern() {
        let horrorCategory = VODCategory(name: "Horror", description: "Horror movies category")
        let tvSeriesCategory = VODCategory(name: "TV Series", description: "TV Series category")
        let comedyCategory = VODCategory(name: "Comedy", description: "Comedy Category")
        let voSTTvSerries = VODCategory(name: "VOSTSeries", description: "VOST TV Series sub category")
        let allVODComponents = VODCategory(name: "All VOD", description: "VOD vod components")
        let vodManager = VODManager(vod: allVODComponents)
        
        allVODComponents.add(vodComponent: horrorCategory)
        allVODComponents.add(vodComponent: tvSeriesCategory)
        allVODComponents.add(vodComponent: comedyCategory)
        allVODComponents.add(vodComponent: voSTTvSerries)
        
        tvSeriesCategory.add(vodComponent: voSTTvSerries)
        horrorCategory.add(vodComponent: VODItem(name: "Scream", description: "Scream Movie", price: 9.99))
        horrorCategory.add(vodComponent: VODItem(name: "Paranormal Activity", description: "Paranormal Activity movie", price: 9.99))
        horrorCategory.add(vodComponent: VODItem(name: "Blair Witch Project", description: "Blair Witch movie", price: 9.99))
        tvSeriesCategory.add(vodComponent: VODItem(name: "Game of thrones S1E1", description: "Game of thrones Saison 1 episode 1", price: 1.99))
        tvSeriesCategory.add(vodComponent: VODItem(name: "Deadwood", description: "Deadwood Saison 1 episode 1", price: 1.99))
        tvSeriesCategory.add(vodComponent: VODItem(name: "Breaking Bad", description: "Breaking Bad Saison 1 Episode 1", price: 1.99))
        voSTTvSerries.add(vodComponent: VODItem(name: "Camping Paradis", description: "Camping Paradis French", price: 1.99))
        comedyCategory.add(vodComponent: VODItem(name: "Very Bad Trip", description: "Very Bad Trip Movie", price: 9.99))
        comedyCategory.add(vodComponent: VODItem(name: "Hot Chick", description: "Hot Chick Movie", price: 9.99))
        comedyCategory.add(vodComponent: VODItem(name: "Step Brothers", description: "Step Brothers Movie", price: 9.99))
        comedyCategory.add(vodComponent: VODItem(name: "Bad teacher", description: "Bad Teacher Movie", price: 9.99))
        vodManager.displayCatalog()
    }
}

