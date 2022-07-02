//
//  GalleryViewController.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryView: GalleryView!
    var galleryModel: GalleryModel = GalleryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryView.delegate = self
        
        galleryView.setUpUI()
        galleryModel.getData()
        
        let animalsData = galleryModel.animals
        galleryView.animals = animalsData
    }
}
extension GalleryViewController:GalleryViewDelegate{
    func animalSelected(animal : Animal?) {
        let detailsVc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        detailsVc.detailsModel.animal = animal
        navigationController?.pushViewController(detailsVc, animated: true)
    }
}
