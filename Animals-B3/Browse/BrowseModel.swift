//
//  BrowseModel.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import Foundation

class BrowseModel {
    var animals: Animals = []
    var coverAnimals: Animals = []
    
    func getData() {
        animals = Bundle.main.decode("animals.json")
        coverAnimals = Bundle.main.decode("covers.json")
    }
    
}
