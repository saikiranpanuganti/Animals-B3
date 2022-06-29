//
//  QuotesCollectionViewCell.swift
//  Animals-B3
//
//  Created by jagadheesh on 29/06/22.
//

import UIKit

class QuotesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var quoteLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureUI(animal:Animal){
        quoteLabel.text = animal.animalDescription
    }

}
