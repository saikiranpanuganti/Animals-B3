//
//  ImagesCollectionViewCell.swift
//  Animals-B3
//
//  Created by jagadheesh on 29/06/22.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImages : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        animalImages.layer.cornerRadius = 10.0
    }
    
    func configureUI(animalImage: String?){
        animalImages.image = UIImage(named: animalImage ?? "")
    }
}
