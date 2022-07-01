//
//  AnimalImagesCollectionViewCell.swift
//  Animals-B3
//
//  Created by pampana ajay on 28/06/22.
//

import UIKit

class AnimalImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        animalImage.layer.borderWidth = 3
        animalImage.layer.borderColor = UIColor.black.cgColor
    }
    
    func configUI(animal: Animal, width: CGFloat) {
        animalImage.layer.cornerRadius = width*0.7/2
        animalImage.image = UIImage(named: animal.image ?? "")
    }
}
