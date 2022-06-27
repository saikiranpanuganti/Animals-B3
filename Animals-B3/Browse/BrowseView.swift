//
//  BrowseView.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import Foundation
import UIKit

class BrowseView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var animals: Animals = []
    var coverAnimals: Animals = []
    
    func setUpUI() {
        collectionView.register(UINib(nibName: "HeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroCollectionViewCell")
        collectionView.register(UINib(nibName: "AnimalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension BrowseView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return animals.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as? HeroCollectionViewCell {
                cell.configureUI(coverAnimals: coverAnimals)
                return cell
            }
        }else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as? AnimalCollectionViewCell {
                cell.configureUI(animal: animals[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension BrowseView: UICollectionViewDelegate {
    
}

extension BrowseView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: CoverCellHeight)
        }else {
            return CGSize(width: collectionView.frame.width, height: 110)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
