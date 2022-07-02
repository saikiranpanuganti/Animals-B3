//
//  AnimalAnnotationView.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 01/07/22.
//

import Foundation
import MapKit

class AnimalAnnotationView: MKAnnotationView {
    var animatingView: UIView?
    
    init(annotation: MKAnnotation?, reuseIdentifier: String?, image: String) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        addBackgroundAndImage(image: image)
        animateBorderRadius()
        animateBorderColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackgroundAndImage(image: String) {
        let view = UIView(frame: CGRect(x: -50, y: -50, width: 100, height: 100))
        addSubview(view)
        
        let animatingView = UIView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
        animatingView.layer.borderWidth = 2.0
        animatingView.layer.borderColor = UIColor(named: "AppColor_Orange")?.cgColor
        animatingView.layer.cornerRadius = 25
        view.addSubview(animatingView)
        
        self.animatingView = animatingView
        
        let imageView = UIImageView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
        imageView.image = UIImage(named: image)
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor(named: "AppColor_Orange")?.cgColor
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    func animateBorderColor() {
        let animation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = UIColor(named: "AppColor_Orange")?.cgColor
        animation.toValue = UIColor(named: "AppColor_Orange_Zero")?.cgColor
        animation.duration = 1.2
        animatingView?.layer.add(animation, forKey: "borderColor")
        animatingView?.layer.borderColor = UIColor(named: "AppColor_Orange_Zero")?.cgColor
    }
    
    func animateBorderRadius() {
        UIView.animate(withDuration: 1.2) {
            self.animatingView?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        } completion: { bool in
            self.animatingView?.transform = .identity
            self.animatingView?.layer.borderColor = UIColor(named: "AppColor_Orange")?.cgColor
            self.animateBorderRadius()
            self.animateBorderColor()
        }
    }
}
