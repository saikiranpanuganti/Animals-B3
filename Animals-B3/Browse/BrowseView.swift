//
//  BrowseView.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import Foundation
import UIKit

enum HomeType {
    case square2x2
    case square2x3
    case square1x1
    case squarexHero
}

protocol BrowseViewDelegate {
    func animalSelected(animal: Animal?)
}

class BrowseView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var leftButtonImage: UIImageView!
    @IBOutlet weak var rightButtonImage: UIImageView!
    
    var delegate: BrowseViewDelegate?
    
    var animals: Animals = []
    var coverAnimals: Animals = []
    var square2x2 = "square.grid.2x2"
    var square2x3 = "square.grid.3x2"
    var square1x1 = "rectangle.grid.1x2"
    var homeType: HomeType = .squarexHero
    
    func setUpUI() {
        collectionView.register(UINib(nibName: "HeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroCollectionViewCell")
        collectionView.register(UINib(nibName: "AnimalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalCollectionViewCell")
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func leftButtonTapped() {
        leftButtonImage.tintColor = UIColor(named: "AppColor_Orange")
        rightButtonImage.tintColor = UIColor.black
        homeType = .squarexHero
        updateUI()
    }
    
    @IBAction func rightButtonTapped() {
        leftButtonImage.tintColor = UIColor.black
        rightButtonImage.tintColor = UIColor(named: "AppColor_Orange")
        
        if homeType == .squarexHero {
            homeType = .square2x3
        }else if homeType == .square2x3 {
            homeType = .square1x1
        }else if homeType == .square1x1 {
            homeType = .square2x2
        }else if homeType == .square2x2 {
            homeType = .square2x3
        }
        
        updateUI()
    }
}

extension BrowseView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if homeType == .squarexHero {
            return 2
        }else if homeType == .square2x3 {
            return 1
        }else if homeType == .square1x1 {
            return 1
        }else  if homeType == .square2x2{
            return 1
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if homeType == .squarexHero {
            if section == 0 {
                return 1
            }else {
                return animals.count
            }
        }else if homeType == .square2x3 {
            return animals.count
        }else if homeType == .square1x1{
            return animals.count
        }else if homeType == .square2x2{
            return animals.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if homeType == .squarexHero {
            if indexPath.section == 0 {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as? HeroCollectionViewCell {
                    cell.delegate = self
                    cell.configureUI(coverAnimals: coverAnimals)
                    return cell
                }
            }else {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as? AnimalCollectionViewCell {
                    cell.configureUI(animal: animals[indexPath.row])
                    return cell
                }
            }
        }else if homeType == .square2x3 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.configureUI_img(animal: animals[indexPath.row])
                rightButtonImage.image = UIImage(systemName: "square.grid.3x2")
                return cell
            }
        }else if homeType == .square1x1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.configureUI_img(animal: animals[indexPath.row])
                rightButtonImage.image = UIImage(systemName: "rectangle.grid.1x2")
                return cell
            }
        } else if homeType == .square2x2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.configureUI_img(animal: animals[indexPath.row])
                rightButtonImage.image = UIImage(systemName: "square.grid.2x2")
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}
extension BrowseView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.animalSelected(animal: animals[indexPath.row])
    }
}
extension BrowseView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if homeType == .squarexHero {
            if indexPath.section == 0 {
                return CGSize(width: collectionView.frame.width, height: CoverCellHeight)
            }else {
                return CGSize(width: collectionView.frame.width, height: 110)
            }
        }else if homeType == .square2x3 {
            return CGSize(width: (collectionView.frame.width-21)/3, height: ((collectionView.frame.width-21)/3)*0.6)
        }else if homeType == .square1x1 {
            return CGSize(width: (collectionView.frame.width), height:220)
        }else if homeType == .square2x2 {
            return CGSize(width: (collectionView.frame.width-10)/2, height: 100)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if homeType == .square2x3 {
            return 10
        }else if homeType == .square1x1 {
            return 10
        }else if homeType == .square2x2 {
            return 10
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if homeType == .square2x3 {
            return 10
        }else if homeType == .square1x1{
            return 10
        }else if homeType == .square2x2{
            return 10
        }
        return 0
    }
}

extension BrowseView: HeroCollectionViewCellDelegate {
    func animalTapped(animal: Animal?) {
        delegate?.animalSelected(animal: animal)
    }
}
