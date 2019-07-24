import MapKit
import SwiftUI
import CoreLocation
import UIKit



struct MapView : UIViewRepresentable {
    
    @EnvironmentObject var data: Datas
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView{
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() , execute: {

                let coordinate = CLLocationCoordinate2D(latitude: (Datas.destinationCoordinate.latitude + Datas.originCoordinate.latitude)/2, longitude: (Datas.destinationCoordinate.longitude + Datas.originCoordinate.longitude)/2)
                
                
                let span = MKCoordinateSpan(latitudeDelta: 0.2 , longitudeDelta: 0.2)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                mapView.setRegion(region, animated: true)
                
                     let originAnnotation = MKPointAnnotation()
                originAnnotation.coordinate = Datas.originCoordinate
                     originAnnotation.title = "1"
                     
                     let destinationAnnotation = MKPointAnnotation()
                destinationAnnotation.coordinate = Datas.destinationCoordinate
                     destinationAnnotation.title = "2"
                     
                     
                     mapView.addAnnotation(originAnnotation)
                     mapView.addAnnotation(destinationAnnotation)
            })

        }
        
        


        
    }
    
    class Coordinator:NSObject, MKMapViewDelegate {
        var mpView: MapView
        
        
        init(_ mpView: MapView) {
            self.mpView = mpView
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
            }
            if let title = annotation.title , title == "1"{
            annotationView?.image = UIImage(named: "originPin")
            } else if let title  = annotation.title,  title == "2"{
                annotationView?.image = UIImage(named: "destinationPin")
            } else {
                return nil
            }
            annotationView?.canShowCallout = false

            return annotationView
        }
        
    }

}






#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(Datas())
    }
}
#endif
