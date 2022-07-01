//
//  AnimalAnnotationView.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 01/07/22.
//

import Foundation
import MapKit

class AnimalAnnotationView: MKAnnotationView {
    
    init(annotation: MKAnnotation?, reuseIdentifier: String?, image: String) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        addBackgroundAndImage(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackgroundAndImage(image: String) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        addSubview(view)
        
        let imageView = UIImageView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
        imageView.image = UIImage(named: image)
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor(named: "AppColor_Orange")?.cgColor
        imageView.layer.cornerRadius = 25
        view.addSubview(imageView)
    }
}
