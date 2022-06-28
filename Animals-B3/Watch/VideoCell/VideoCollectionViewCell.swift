//
//  VideoCollectionViewCell.swift
//  Animals-B3
//
//  Created by jagadheesh on 28/06/22.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImage : UIImageView!
    @IBOutlet weak var animalName : UILabel!
    @IBOutlet weak var animalDescription : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        animalImage.layer.cornerRadius = 10
    }
    
    func configureUI(animal: Watch) {
        animalImage.image = UIImage(named: animal.id ?? "")
        animalName.text = animal.name
        animalDescription.text = animal.headline
    }

}
