//
//  LocationsView.swift
//  Animals-B3
//
//  Created by Saikiran Panuganti on 01/07/22.
//

import UIKit
import MapKit

class LocationsView: UIView {
    @IBOutlet weak var locationsMapView: MKMapView!
    
    var locations: Locations = []
    
    func updateUI() {
        let center = CLLocationCoordinate2D(latitude: -15.600286, longitude: 30.4377599)
        let span = MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
        let region = MKCoordinateRegion(center: center, span: span)

        locationsMapView.delegate = self
        locationsMapView.setRegion(region, animated: false)
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude ?? 0, longitude: location.longitude ?? 0)
            
            locationsMapView.addAnnotation(annotation)
        }
    }

}

extension LocationsView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "animalAnnotation"
        var animalAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if animalAnnotation == nil {
            if let title = annotation.title, let firstComponent = title?.components(separatedBy: " ").first?.lowercased() {
                let image = "map-" + firstComponent
                
                animalAnnotation = AnimalAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier, image: image)
            }
        }else {
            animalAnnotation?.annotation = annotation
        }
        
        return animalAnnotation
    }
}
