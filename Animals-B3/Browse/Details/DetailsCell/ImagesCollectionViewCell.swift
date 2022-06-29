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
    
    }
    func configureUI(animal:Animal){
        animalImages.image = UIImage(named: animal.image ?? "")
    }

}
