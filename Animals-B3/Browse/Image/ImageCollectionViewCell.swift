//
//  ImageCollectionViewCell.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureUI(animal: Animal) {
        animalImage.image = UIImage(named: animal.coverImage ?? "")
    }
}
