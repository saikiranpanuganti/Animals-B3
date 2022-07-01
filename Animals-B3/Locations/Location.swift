//
//  Location.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 01/07/22.
//

import Foundation

// MARK: - Location
struct Location: Codable {
    let id, name, image: String?
    let latitude, longitude: Double?
}

typealias Locations = [Location]
