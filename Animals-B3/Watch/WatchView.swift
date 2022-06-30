//
//  WatchView.swift
//  Animals-B3
//
//  Created by jagadheesh on 28/06/22.
//

import Foundation
import UIKit

protocol WatchViewDelegate {
    func playVideo(path: String)
}

class WatchView : UIView {
    @IBOutlet weak var watchCollectionView : UICollectionView!
    
    var delegate: WatchViewDelegate?
    
    var animalData:[Watch] = []

    func setUpUI(){
        watchCollectionView.register(UINib(nibName: "VideoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionViewCell")
        
        watchCollectionView.dataSource = self
        watchCollectionView.delegate = self
    }
    @IBAction func shuffleButtonTapped(){
        animalData = animalData.shuffled()
        watchCollectionView.reloadData()
    }
}
extension WatchView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = watchCollectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath) as? VideoCollectionViewCell {
            cell.configureUI(animal: animalData[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
extension WatchView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if var animalId = animalData[indexPath.row].id {
            animalId.removeFirst(6)
            guard let path = Bundle.main.path(forResource: animalId, ofType:"mp4") else { return }
            delegate?.playVideo(path: path)
        }
    }
}
extension WatchView : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: watchCollectionView.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
