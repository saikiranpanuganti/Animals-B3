//
//  TabBarViewController.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 25/06/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        setUpControllers()
        
    }
    
    func setUpTabBar() {
        tabBar.tintColor = UIColor(named: "AppColor_Orange")
        tabBar.unselectedItemTintColor = UIColor.darkGray
        tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    }
    
    func setUpControllers() {
        let browseController = BrowseViewController(nibName: "BrowseViewController", bundle: nil)
        browseController.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2"))
        
        let watchController = WatchViewController(nibName: "WatchViewController", bundle: nil)
        watchController.tabBarItem = UITabBarItem(title: "Watch", image: UIImage(systemName: "play.rectangle"), selectedImage: UIImage(systemName: "play.rectangle"))
        
        let locationsController = LocationsViewController(nibName: "LocationsViewController", bundle: nil)
        locationsController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map"))
        
        let galleryController = GalleryViewController(nibName: "GalleryViewController", bundle: nil)
        galleryController.tabBarItem = UITabBarItem(title: "Gallery", image: UIImage(systemName: "photo"), selectedImage: UIImage(systemName: "photo"))
        
        viewControllers = [browseController, watchController, locationsController, galleryController]
    }

}
