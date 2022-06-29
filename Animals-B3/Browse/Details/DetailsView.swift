//
//  DetailsView.swift
//  Animals-B3
//
//  Created by jagadheesh on 29/06/22.
//

import Foundation
import UIKit

class DetailsView: UIView {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var quotesCollectionView: UICollectionView!
    
    var animals: Animals = []

    func setUpUI(){
        
        imagesCollectionView.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        quotesCollectionView.register(UINib(nibName: "QuotesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuotesCollectionViewCell")
        
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        quotesCollectionView.dataSource = self
        quotesCollectionView.delegate = self
    }
}
extension DetailsView:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as? ImagesCollectionViewCell {
                cell.configureUI(animal: animals[indexPath.row])
                return cell
            }
        }else {
            if let cell = quotesCollectionView.dequeueReusableCell(withReuseIdentifier: "QuotesCollectionViewCell", for: indexPath) as? QuotesCollectionViewCell {
                cell.configureUI(animal: animals[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }

}
extension DetailsView : UICollectionViewDelegate{
    
}
extension DetailsView : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imagesCollectionView.frame.width, height: 200)
    }
}
