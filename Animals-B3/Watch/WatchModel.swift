//
//  WatchModel.swift
//  Animals-B3
//
//  Created by jagadheesh on 28/06/22.
//

import Foundation

class WatchModel {
    var animalData : Videos = []
    
    func getData() {
        animalData = Bundle.main.decode("videos.json")
    }
}
