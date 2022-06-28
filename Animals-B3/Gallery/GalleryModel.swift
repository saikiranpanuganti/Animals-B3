//
//  GalleryModel.swift
//  Animals-B3
//
//  Created by pampana ajay on 28/06/22.
//

import Foundation

class GalleryModel {
    var animals: Animals = []
    var coverAnimals: Animals = []
    
    func getData() {
        animals = Bundle.main.decode("animals.json")
        coverAnimals = Bundle.main.decode("covers.json")
    }
}
