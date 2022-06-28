//
//  WatchViewController.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit

class WatchViewController: UIViewController {
    @IBOutlet weak var watchView : WatchView!
    var watchModel: WatchModel = WatchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watchView.setUpUI()
        watchModel.getData()
        
        let data = watchModel.animalData
        watchView.animalData = data
    }
    
}
