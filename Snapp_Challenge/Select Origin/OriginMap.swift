import MapKit
import SwiftUI
import CoreLocation
import UIKit



struct OriginMap : UIViewRepresentable {
    
    @EnvironmentObject var data: Datas
    
    
    
     func makeUIView(context: UIViewRepresentableContext<OriginMap>) -> MKMapView{
        let mapView = MKMapView()
        
        mapView.delegate = context.coordinator
        

        return mapView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    

    
    
     func updateUIView(_ mapView: MKMapView, context: Context) {
        let locationManager = CLLocationManager()
        
        func zoomOnCurrentLocation() -> Void {
            let locationManager = CLLocationManager()

            let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)

            let region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }

        mapView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
                let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate
                
                
                let coordinate = CLLocationCoordinate2D(
                    latitude: locValue.latitude, longitude: locValue.longitude)
                Datas.currentLocation = coordinate
                
                
                let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                mapView.setRegion(region, animated: true)
                
                
            })
        }}
    
    class Coordinator:NSObject, MKMapViewDelegate {
        var mpView: OriginMap
        init(_ mpView: OriginMap) {
            self.mpView = mpView
            
        }
        
        func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
                Datas.originIsSelected = true

        }
        
        func mapView(_ mapView: MKMapView,
                     regionDidChangeAnimated animated: Bool){
            Datas.originIsSelected = false
            
            Datas.originCoordinate = mapView.centerCoordinate

        }
        
    }
}






#if DEBUG
struct OriginMap_Previews : PreviewProvider {
    static var previews: some View {
        OriginMap()
            .environmentObject(Datas())
    }
}
#endif
