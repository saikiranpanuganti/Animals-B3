//
//  DetailsView.swift
//  Animals-B3
//
//  Created by jagadheesh on 29/06/22.
//

import Foundation
import UIKit

protocol DetailsViewDelegate {
    func backTapped()
}

class DetailsView: UIView {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalTitle: UILabel!
    @IBOutlet weak var animalHeadline: UILabel!
    @IBOutlet weak var allAbout: UILabel!
    @IBOutlet weak var animalWiki: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var quotesCollectionView: UICollectionView!
    @IBOutlet weak var quotesPageController: UIPageControl!
    
    var delegate: DetailsViewDelegate?
    
    var animal: Animal?
    
    var currentPage: Int = 0
    

    func setUpUI(){
        
        imagesCollectionView.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        quotesCollectionView.register(UINib(nibName: "QuotesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuotesCollectionViewCell")
        
        quotesCollectionView.layer.cornerRadius = 10.0
        
        animalImage.image = UIImage(named: animal?.image ?? "")
        animalTitle.text = animal?.name
        animalHeadline.text = animal?.headline
        animalWiki.text = animal?.name
        allAbout.text = "All about " + (animal?.name ?? "")
        animalDescription.text = animal?.animalDescription
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        quotesCollectionView.dataSource = self
        quotesCollectionView.delegate = self
    }
    
    @IBAction func backTapped() {
        delegate?.backTapped()
    }
    
    @IBAction func wikiLinktapped() {
        if let urlString = animal?.link {
            guard let url = URL(string: urlString) else { return }
            UIApplication.shared.open(url)
        }
        
    }
}
extension DetailsView:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imagesCollectionView {
            return animal?.gallery?.count ?? 0
        }else {
            return animal?.fact?.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imagesCollectionView {
            if let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as? ImagesCollectionViewCell {
                cell.configureUI(animalImage: animal?.gallery?[indexPath.row])
                return cell
            }
        }else {
            if let cell = quotesCollectionView.dequeueReusableCell(withReuseIdentifier: "QuotesCollectionViewCell", for: indexPath) as? QuotesCollectionViewCell {
                cell.configureUI(animalFact: animal?.fact?[indexPath.row])
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
        if collectionView == imagesCollectionView {
            return CGSize(width: imagesCollectionView.frame.width - 30, height: imagesCollectionView.frame.height)
        }else {
            return CGSize(width: quotesCollectionView.frame.width, height: quotesCollectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == imagesCollectionView {
            return 10
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == imagesCollectionView {
            return 10
        }else {
            return 0
        }
    }
}
extension DetailsView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.x)
        let currentPage = Int(scrollView.contentOffset.x)/374
        if self.currentPage != currentPage {
            self.currentPage = currentPage
            quotesPageController.currentPage = currentPage
    }
}
}
