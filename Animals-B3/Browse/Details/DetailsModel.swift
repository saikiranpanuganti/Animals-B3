//
//  DetailsModel.swift
//  Animals-B3
//
//  Created by jagadheesh on 29/06/22.
//

import Foundation

class DetailsModel {
    var animals: Animals = []
    var coverAnimals: Animals = []
    
    func getData() {
        animals = Bundle.main.decode("animals.json")

    }
}
