//
//  GalleryView.swift
//  Animals-B3
//
//  Created by pampana ajay on 28/06/22.
//

import UIKit

class GalleryView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var animals: Animals = []
    
    func setUpUI() {
        collectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView.register(UINib(nibName: "AnimalImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimalImagesCollectionViewCell")
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension GalleryView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return animals.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell {
                cell.configUi(animal: animals[indexPath.row] )
                return cell
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalImagesCollectionViewCell", for: indexPath) as? AnimalImagesCollectionViewCell {
                cell.configUI(animal: animals[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension GalleryView: UICollectionViewDelegate {
    
}

extension GalleryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width-40, height: 370)
        }else{
            return CGSize(width: (collectionView.frame.width-40)/3, height: 110)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

