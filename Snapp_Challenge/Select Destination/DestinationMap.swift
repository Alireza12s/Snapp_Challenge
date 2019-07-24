import MapKit
import SwiftUI
import CoreLocation
import UIKit



struct DestinationMap : UIViewRepresentable {
    
    @EnvironmentObject var data: Datas
    
    func makeUIView(context: UIViewRepresentableContext<DestinationMap>) -> MKMapView{
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let locationManager = CLLocationManager()
        mapView.showsUserLocation = true
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
            DispatchQueue.main.asyncAfter(deadline: .now()  , execute: {
                
                let coordinate = Datas.originCoordinate
                let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                mapView.setRegion(region, animated: true)
                
                
                let originAnnotation = MKPointAnnotation()
                originAnnotation.title = "1"
                originAnnotation.coordinate = Datas.originCoordinate
                mapView.addAnnotation(originAnnotation)
            })
            
            
            
        }
        
        
        
        
    }
    
    class Coordinator:NSObject, MKMapViewDelegate {
        var mpView: DestinationMap
        @EnvironmentObject var data: Datas
        
        init(_ mpView: DestinationMap) {
            self.mpView = mpView
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
            }
            
            
            if let title = annotation.title, title == "1"{
            annotationView?.image = UIImage(named: "originPin")
            annotationView?.canShowCallout = true
            } else {
                return nil
            }
            
            
            
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
            Datas.destinationIsSelected = true
            
        }
        
        func mapView(_ mapView: MKMapView,
                     regionDidChangeAnimated animated: Bool){
            Datas.destinationIsSelected = false
            Datas.destinationCoordinate = mapView.centerCoordinate
        }
        
        
        
    }
    
    
    
    
}






#if DEBUG
struct DestinationMap_Previews : PreviewProvider {
    static var previews: some View {
        DestinationMap()
            .environmentObject(Datas())
    }
}
#endif
