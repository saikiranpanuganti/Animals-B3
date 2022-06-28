//
//  Watch.swift
//  Animals-B3
//
//  Created by jagadheesh on 28/06/22.
//

import Foundation

// MARK: - Watch
struct Watch: Codable {
    let id, name, headline: String?
}

typealias Videos = [Watch]
