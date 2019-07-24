import Combine
import SwiftUI
import MapKit

struct FavouritesBar : View {
    @EnvironmentObject var data: Datas
    
    var link: NavigationDestinationLink<TravelCostPage>
    var publisher: AnyPublisher<Void, Never>
    
    init() {
        let publisher = PassthroughSubject<Void, Never>()
        self.link = NavigationDestinationLink(
            TravelCostPage(onDismiss: { publisher.send() }),
            isDetail: false
        )
        self.publisher = publisher.eraseToAnyPublisher()
    }
    
    
    var body: some View {
        

        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(0 ..< Datas.favourites.count){item in
                    Button(action: {
                        Datas.destinationCoordinate = CLLocationCoordinate2D(latitude: Datas.favourites[item]["latitude"] as! CLLocationDegrees, longitude: Datas.favourites[item]["longitude"] as! CLLocationDegrees)
                        self.link.presented?.value = true
                    }) {
                    FavouriteItem(text: Datas.favourites[item]["name"] as! String)
                    }
                }
            }.frame(height: 30)
               
        }.offset(y: 5)

       
        
        
        
    }
}





#if DEBUG
struct FavouritesBar_Previews : PreviewProvider {
    static var previews: some View {
        FavouritesBar()
            .environmentObject(Datas())
    }
}
#endif
