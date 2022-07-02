//
//  AnimalImageCollectionViewCell.swift
//  Animals-B3
//
//  Created by pampana ajay on 28/06/22.
//

import UIKit

protocol BannerCollectionViewCellDelegate {
    func updateCellSize(cellsPerRow: CellsPerRow)
}

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    var delegate: BannerCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        animalImage.layer.cornerRadius = animalImage.frame.width/2
        animalImage.layer.borderWidth = 8
        animalImage.layer.borderColor = UIColor.black.cgColor
    
    }
    
    func configUi(animal: Animal) {
        animalImage.image = UIImage(named: animal.image ?? "" )
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if sender.value < 0.5 {
            sender.value = 0
            delegate?.updateCellSize(cellsPerRow: .two)
        }else if sender.value >= 0.5 && sender.value < 1.5 {
            sender.value = 1
            delegate?.updateCellSize(cellsPerRow: .three)
        }else if sender.value >= 1.5 {
            sender.value = 2
            delegate?.updateCellSize(cellsPerRow: .four)
        }
    }
}
