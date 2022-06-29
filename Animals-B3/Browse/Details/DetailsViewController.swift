//
//  DetailsViewController.swift
//  Animals-B3
//
//  Created by jagadheesh on 29/06/22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsView: DetailsView!
    var detailsModel: DetailsModel = DetailsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsView.setUpUI()
        detailsModel.getData()
        
        let data = detailsModel.animals
        detailsView.animals = data
        
    }
}
