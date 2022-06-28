//
//  HeroCollectionViewCell.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var coverAnimals: Animals = []
    var currentPage: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configureUI(coverAnimals: Animals) {
        self.coverAnimals = coverAnimals
        
        DispatchQueue.main.async {
            self.pageControl.numberOfPages = coverAnimals.count
            self.collectionView.reloadData()
        }
    }

}

extension HeroCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coverAnimals.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.configureUI(animal: coverAnimals[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension HeroCollectionViewCell: UICollectionViewDelegate {
    
}

extension HeroCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CoverCellHeight - 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HeroCollectionViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        let currentPage = Int(scrollView.contentOffset.x)/394
        if self.currentPage != currentPage {
            self.currentPage = currentPage
            pageControl.currentPage = currentPage
        }
    }
}


//394/394 = 1
//
//393/394 Q = 0 , R = 393
//
//395/394 = Q = 1, R = 1
