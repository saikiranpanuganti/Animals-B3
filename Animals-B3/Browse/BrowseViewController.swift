//
//  BrowseViewController.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit

class BrowseViewController: UIViewController {
    @IBOutlet weak var browseView: BrowseView!
    var browseModel: BrowseModel = BrowseModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        browseView.delegate = self
        
        browseView.setUpUI()
        browseModel.getData()
        
        let animalsData = browseModel.animals
        browseView.animals = animalsData
        
        let coverAnimalsData = browseModel.coverAnimals
        browseView.coverAnimals = coverAnimalsData
    }

}

extension BrowseViewController: BrowseViewDelegate {
    func animalSelected(animal: Animal?) {
        let detailsVc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        detailsVc.detailsModel.animal = animal
        navigationController?.pushViewController(detailsVc, animated: true)
    }
}
