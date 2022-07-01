//
//  LocationsViewController.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit

class LocationsViewController: UIViewController {
    @IBOutlet weak var locationsView: LocationsView!
    var locationsModel: LocationsModel = LocationsModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationsModel.getData()
        
        let data = locationsModel.locations
        locationsView.locations = data
        
        locationsView.updateUI()
    }

}
