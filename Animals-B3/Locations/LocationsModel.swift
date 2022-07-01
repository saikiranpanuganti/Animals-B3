//
//  LocationsModel.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 01/07/22.
//

import Foundation

class LocationsModel {
    var locations: Locations = []
    
    func getData() {
        locations = Bundle.main.decode("locations.json")
    }
}
