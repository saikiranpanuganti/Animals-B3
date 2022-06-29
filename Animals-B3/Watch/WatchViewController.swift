//
//  WatchViewController.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 27/06/22.
//

import UIKit
import AVKit

class WatchViewController: UIViewController {
    @IBOutlet weak var watchView : WatchView!
    var watchModel: WatchModel = WatchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watchView.delegate = self
        
        watchView.setUpUI()
        watchModel.getData()
        
        let data = watchModel.animalData
        watchView.animalData = data
    }
    
    func playVideo(path: String) {
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}

extension WatchViewController: WatchViewDelegate {
    
}
