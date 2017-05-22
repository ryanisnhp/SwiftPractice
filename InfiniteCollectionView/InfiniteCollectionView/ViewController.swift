//
//  ViewController.swift
//  InfiniteCollectionView
//
//  Created by Le Van Lam on 5/22/17.
//  Copyright © 2017 Lam LeVan. All rights reserved.
//

import UIKit

struct Images {
    
    var urlStrings: [String] = [
        "https://s-media-cache-ak0.pinimg.com/564x/a7/a1/38/a7a1384d369333395c6b17a667568e14.jpg",
        "https://s-media-cache-ak0.pinimg.com/564x/aa/2e/c5/aa2ec5f318e44946f5484da8d1f2f323.jpg",
        "https://s-media-cache-ak0.pinimg.com/564x/8f/eb/d8/8febd8e73e3baaf73c1156f62da96e8e.jpg",
        "https://s-media-cache-ak0.pinimg.com/564x/d1/1f/df/d11fdf322549d0726307ddac98028538.jpg"
    ]
}

class ViewController: UIViewController {

    @IBOutlet weak fileprivate var collectionView: UICollectionView!
    let imagesStruct = Images()
    fileprivate var imageUrlStrings: [String] = []
    fileprivate var count: CGFloat {
        return CGFloat(imagesStruct.urlStrings.count)
    }
    private var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageUrlStrings = viewModel.images
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(images: imagesStruct)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrlStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell {
            cell.configCell(urlString: imageUrlStrings[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateContentOffSet(scrollView)
    }
    
    private func updateContentOffSet(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        if x < UIScreen.width * count {
            scrollView.contentOffset.x = x + UIScreen.width * count
        } else if x > UIScreen.width * 2 * count {
            scrollView.contentOffset.x = x - UIScreen.width * count
        }
    }
}

extension UIScreen {
    class var width: CGFloat {
        return UIScreen.main.bounds.width
    }
}
