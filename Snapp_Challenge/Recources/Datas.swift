import MapKit
import Combine
import SwiftUI


final class Datas: BindableObject {

    let willChange = PassthroughSubject<Void, Never>()
        
    static let favourites  = [
        ["name": "خانه","latitude": 35.758925 ,"longitude": 51.432812 ],
        ["name": "خانه اقا حامد","latitude": 35.743665 ,"longitude": 51.294855 ],
        ["name": "مدرسه","latitude": 35.814581 ,"longitude": 51.458032 ],
        ["name": "دانشگاه درب ولیعصر","latitude": 35.703934 ,"longitude": 51.405822 ]]
    
    static var originCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0) 
    
    static var currentLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    static var destinationCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
            
    static var originIsSelected = false
    
    static var destinationIsSelected = false
    
    var check = false { didSet{willChange.send(())}}
    
    var favourite = 0 { didSet { willChange.send(())}}
    
    var Cost = 145000 { didSet { willChange.send(())}}
    
    var off: Double = 1.0 { didSet { willChange.send(())}}
    
    var travelType = "درخواست اسنپ اکو" { didSet { willChange.send(())}}

    var code =  "" { didSet { willChange.send(())}}
    
    var codeDidUsed =  false { didSet { willChange.send(())}}
}
