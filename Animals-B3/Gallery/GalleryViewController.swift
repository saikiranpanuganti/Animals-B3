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
        
        galleryView.setUpUI()
        galleryModel.getData()
        
        let animalsData = galleryModel.animals
        galleryView.animals = animalsData
        
        
    }
}
