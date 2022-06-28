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
        
        animalImage.layer.cornerRadius = animalImage.frame.width/2
        animalImage.layer.borderWidth = 3
        animalImage.layer.borderColor = UIColor.black.cgColor
    }
    func configUI(animal: Animal) {
        animalImage.image = UIImage(named: animal.image ?? "")
    }

}
